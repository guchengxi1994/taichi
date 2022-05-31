// ignore_for_file: avoid_print

import 'package:taichi_auth/entities/entities.dart';
import 'package:taichi_auth/models/acl.dart';
import 'package:taichi_auth/models/taichi_auth.dart';

Future<void> main() async {
  final t1 = DateTime.now();
  final TaichiAuth taichiAuth = TaichiAuth();

  taichiAuth.setPaths(model: "test/config.ini", policy: "test/test2.csv");

  final acl = await taichiAuth.getAclModel(ACLParams(requireResource: false));
  final Request r = Request(
    action: "read".toEquatable(),
    object: "database1".toEquatable(),
    subject: "jack".toEquatable(),
  );

  bool? res;
  bool? res2;

  if (acl != null) {
    res = taichiAuth.canAccess("acl", r);

    print("[debug res] $res");

    res2 = taichiAuth.canAccess("acl", r);
    print("[debug res2] $res2");
  }

  final t2 = DateTime.now();

  print(t2.difference(t1).inMilliseconds);
}
