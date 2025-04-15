import 'dart:convert';
import 'dart:io';

String toCamelCase(String input) {
  final parts = input.split(RegExp(r'[_\-]'));
  return parts
      .asMap()
      .map((index, part) =>
      MapEntry(index, index == 0 ? part.toLowerCase() : _capitalize(part)))
      .values
      .join();
}

String _capitalize(String input) => input.isEmpty
    ? ''
    : input[0].toUpperCase() + input.substring(1).toLowerCase();

void main() {
  const String filePath = 'assets/languages/vn.json';
  final File file = File(filePath);
  if (!file.existsSync()) {
    print('File not found: $filePath');
    return;
  }

  final String content = file.readAsStringSync();
  final Map<String, dynamic> json = jsonDecode(content);

  final StringBuffer buffer = StringBuffer();
  buffer.writeln('/// GENERATED CODE - DO NOT MODIFY BY HAND');
  buffer.writeln('/// ****************************************************');
  buffer.writeln('///  FlutterGen');
  buffer.writeln('/// ****************************************************');
  buffer.writeln(
      '/// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use');
  buffer.writeln('');
  buffer.writeln('class AppKeys {');
  buffer.writeln('  const AppKeys._();\n');

  json.forEach((String key, dynamic value) {
    buffer.writeln('  static const String ${toCamelCase(key)} = \'$key\';');
  });

  buffer.writeln('}');

  final File output = File('lib/core/gen/app_keys.gen.dart');
  output.createSync(recursive: true);
  output.writeAsStringSync(buffer.toString());

  print('Generated: ${output.path}');
}