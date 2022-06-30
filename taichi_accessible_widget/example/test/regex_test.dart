// ignore_for_file: avoid_print

void main() {
  final RegExp r1 = RegExp("(pagename==/main[^&|]*|widgetname==widget1[^&|]*)");

  String testStr3 =
      "pagename == /main1212 || widgetname == widget1 && visible == true && accessible == false";

  print(r1
      .allMatches(testStr3.replaceAll(" ", ""))
      .map((e) => e.group(0))
      .toList());

  final RegExp r2 =
      RegExp("(pagename==/page2[^&|]*|widgetname==CenterText[^&|]*)");
  String testStr2 =
      "pagename == /page2 && widgetname == CenterText && visible == true && accessible == true";
  print(r2
      .allMatches(testStr2.replaceAll(" ", ""))
      .map((e) => e.group(0))
      .toList());
}
