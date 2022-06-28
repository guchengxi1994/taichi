/// copied from https://github.com/guchengxi1994/taichi/blob/dev/taichi_board_designer/lib/blocks/tools/_string_extension.dart
extension StringFormat on String {
  String format(List data) {
    var res = this;
    for (final i in data) {
      res = res.replaceFirst("{%v}", i.toString());
    }
    return res;
  }
}
