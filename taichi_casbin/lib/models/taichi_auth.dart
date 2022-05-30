// ignore_for_file: avoid_setters_without_getters

/*
 * @Descripttion: 
 * @version: 
 * @Author: xiaoshuyui
 * @email: guchengxi1994@qq.com
 * @Date: 2022-05-28 19:55:23
 * @LastEditors: xiaoshuyui
 * @LastEditTime: 2022-05-29 17:30:42
 */
import 'dart:async';
import 'dart:io';

import 'package:glob/glob.dart';
import 'package:glob/list_local_fs.dart';
import 'package:synchronized/synchronized.dart';
import 'package:taichi_auth/entities/entities.dart';
import 'package:taichi_auth/models/rbac.dart';

// ignore: constant_identifier_names
const MaxLength = 1000;
// ignore: constant_identifier_names
const MaxCacheLength = 20;

class TaichiAuth with TaichiAuthLogMixin, TaichiAuthCacheMixin {
  static final TaichiAuth _instanse = TaichiAuth._();
  bool needsLog = true;

  factory TaichiAuth() {
    return _instanse;
  }

  set setLog(bool b) => needsLog = b;

  late String _modelFilePath = "";
  late String _policyFilePath = "";

  TaichiAuth._() {
    super.mixinInit();
  }

  void setPaths({required String model, required String policy}) {
    streamController.sink.add([
      "model file path: $model",
      "policy file path: $policy",
    ]);

    _modelFilePath = model;
    _policyFilePath = policy;
  }

  late RBACModel _rbacModel;
  Future<RBACModel?> _getRbacModel() async {
    streamController.sink.add([
      "taichi_auth init ...",
      "mode :rbac",
    ]);

    _rbacModel = RBACModel(
      modelFilePath: _modelFilePath,
      policyFilePath: _policyFilePath,
    );

    await _rbacModel.init();

    if (_rbacModel.check()) {
      return _rbacModel;
    } else {
      return null;
    }
  }

  RBACModel? _getRbacModelSync() {
    _rbacModel = RBACModel(
      modelFilePath: _modelFilePath,
      policyFilePath: _policyFilePath,
    );

    _rbacModel.initSync();

    if (_rbacModel.check()) {
      return _rbacModel;
    } else {
      return null;
    }
  }

  Future<RBACModel?> get rbac => _getRbacModel();

  RBACModel? get rbacSync => _getRbacModelSync();

  bool? canAccess(String mode, Request r) {
    final h = r.hashCode;
    final cacheResult = getByCache(h);

    if (cacheResult == null) {
      switch (mode) {
        case "rbac":
          final res = _rbacModel.canAccess(r);
          addCache(r.hashCode, res);
          streamController.sink
              .add(["new request: ${r.toString()}, result:$res"]);
          return res;

        default:
          return false;
      }
    } else {
      streamController.sink
          .add(["use cache: ${r.toString()}, result:$cacheResult"]);
      return cacheResult;
    }
  }
}

/// 用 `dart test` 的时候有可能无法正确写入日志
mixin TaichiAuthLogMixin {
  final currentPath = Directory.current;
  late File logFile;
  final lock = Lock();

  @Deprecated("use ```streamController``` instead")
  void onInit(String mode) {
    writeToLogFile(["taichi_auth init ...", "mode :$mode"]);
  }

  Future<void> writeToLogFile(List<String> messages) async {
    final logMessages =
        messages.map((e) => "[${DateTime.now()}] $e \n").toList();
    await lock.synchronized(() async {
      await logFile.writeAsString(
        logMessages.join(),
        mode: FileMode.append,
        flush: true,
      );
    });
  }

  StreamController<List<String>> streamController = StreamController();

  void mixinInit() {
    logFile = File("${currentPath.path}/auth.log");
    final l = logFile.readAsLinesSync();

    if (l.length >= MaxLength) {
      final logFiles = Glob("**.log");

      final tmpFile = File(
        "${currentPath.path}/auth${logFiles.listSync().length}.log",
      );

      tmpFile.writeAsStringSync(l.join("\n"));
      logFile.writeAsString("");
    }

    // ignore: avoid_print
    print("[debug] init stream");
    streamController.stream.listen((event) async {
      await writeToLogFile(event);
    });
  }
}

mixin TaichiAuthCacheMixin {
  Map<int, bool?> taichiAuthCaches = {};
  bool activateCache = true;

  /// [LRU](https://baike.baidu.com/item/LRU/1269842?fr=aladdin) 缓存机制
  // ignore: avoid_positional_boolean_parameters
  void addCache(int h, bool? b) {
    if (activateCache) {
      if (!taichiAuthCaches.containsKey(h)) {
        if (taichiAuthCaches.keys.length >= MaxCacheLength) {
          taichiAuthCaches
              .removeWhere((key, value) => key == taichiAuthCaches.keys.first);
        }
        taichiAuthCaches[h] = b;
      } else {
        taichiAuthCaches.removeWhere((key, value) => key == h);
        taichiAuthCaches[h] = b;
      }
    }
  }

  bool? getByCache(int h) {
    return taichiAuthCaches[h];
  }

  void deactivateCache() {
    activateCache = false;
  }
}
