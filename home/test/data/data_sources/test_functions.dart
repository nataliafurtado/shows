import 'dart:io';

Future<String> read(String file) async {
  final filePath = 'test/mocks/$file';
  String text;
  try {
    text = await File(filePath).readAsString();
  } catch (e) {
    text = await File('../' + filePath).readAsString();
  }
  return text;
}
