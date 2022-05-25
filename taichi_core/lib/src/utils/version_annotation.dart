part of './taichi_utils.dart';

class VerInfo {
  const VerInfo({required this.code, required this.className, this.info});
  final String code;
  final String className;
  final String? info;
  @override
  String toString() {
    if (info == null) {
      return "$className current version : $code";
    } else {
      return " $className@$code \n $info";
    }
  }
}
