import 'package:ffi/ffi.dart';
import 'package:taichi/src/encrypt/_base_encrypt.dart';
import 'dart:ffi';
import 'dart:io' show Directory;
import 'package:path/path.dart' as path;

import '../../utils/taichi_utils.dart';

class SM4 extends BaseEncrypt {
  String key;
  SM4({required this.key});

  DynamicLibrary? _dylib;

  @override
  void init() {
    if (TaichiDevUtils.isWindows) {
      String dllPath = path.join(Directory.current.path, "sm4.dll");
      _dylib = DynamicLibrary.open(dllPath);
    } else {
      // ignore: avoid_print
      print("platform not supported now");
    }
  }

  @override
  String decode(String s) {
    if (_dylib != null) {
      final Pointer<Utf8> Function(Pointer<Utf8>, Pointer<Utf8>) nativeEncode =
          _dylib!
              .lookup<
                  NativeFunction<
                      Pointer<Utf8> Function(
                          Pointer<Utf8>, Pointer<Utf8>)>>("CBCDecode")
              .asFunction();
      final keyP = key.toNativeUtf8();
      var sP = s.toNativeUtf8();
      String decodeStr = nativeEncode(keyP, sP).toDartString();
      return decodeStr;
    }
    return "";
  }

  @override
  String encode(String s) {
    if (_dylib != null) {
      final Pointer<Utf8> Function(Pointer<Utf8>, Pointer<Utf8>) nativeEncode =
          _dylib!
              .lookup<
                  NativeFunction<
                      Pointer<Utf8> Function(
                          Pointer<Utf8>, Pointer<Utf8>)>>("CBCEncode")
              .asFunction();
      final keyP = key.toNativeUtf8();
      var sP = s.toNativeUtf8();
      String encodeStr = nativeEncode(keyP, sP).toDartString();
      return encodeStr;
    }
    return "";
  }
}
