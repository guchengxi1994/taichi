import 'dart:convert';
// ignore: avoid_web_libraries_in_flutter
import 'dart:html';

void saveFile({
  required List<int> bytes,
  required String downloadName,
}) {
  // Encode our file in base64
  final base64 = base64Encode(bytes);
  // Create the link with the file
  final anchor =
      AnchorElement(href: 'data:application/octet-stream;base64,$base64')
        ..target = 'blank';
  // add the name
  anchor.download = downloadName;
  // trigger download
  document.body!.append(anchor);
  anchor.click();
  anchor.remove();
  return;
}
