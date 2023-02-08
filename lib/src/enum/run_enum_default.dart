import 'dart:io';

import 'package:dart_gen_extra/logger.dart';
import 'package:dart_gen_extra/utils.dart';

/* 
генерируется в одном файле 
fromValue
T map<T>
T maybeMap<T>
T? maybeMapOrNull<T>



в файле должен быть указан стандартный enum и все

переносы должны быть указаны как >>>  LF

например
  enum LocaleEnum { ru, en }


 */

Future<void> runEnumDefault(
    {required String path, required FLILogger logger}) async {
  String contentFile = await UtilsString.readFile(path: path);

  if (contentFile.contains('GENERATED CODE BELOW')) {
    logger.info('Файл $path \nуже имеет генерированные данные');
    return;
  }

  String nameEnum = findText(
    start: "enum",
    end: "{",
    oldContent: contentFile,
  );

  List<String> argEnum = findText(
    start: nameEnum,
    end: "}",
    oldContent: contentFile,
  ).replaceAll('{', '').replaceAll(' ', '').replaceAll('\n', '').split(',');

  if (argEnum.last.isEmpty) argEnum.removeLast();
  if (argEnum.last.isEmpty) argEnum.removeLast();
  if (argEnum.last.isEmpty) argEnum.removeLast();

  StringBuffer constructor = StringBuffer();
  StringBuffer fromValue = StringBuffer();

  /// Pattern matching
  StringBuffer mapStart = StringBuffer();
  StringBuffer mapEnd = StringBuffer();
  StringBuffer maybeMapStart = StringBuffer();
  StringBuffer maybeMapEnd = StringBuffer();
  StringBuffer maybeMapOrNullStart = StringBuffer();
  StringBuffer maybeMapOrNullEnd = StringBuffer();
  String v = '';
  String lastSymbolArg = '';

  for (int i = 0; i < argEnum.length; i++) {
    v = argEnum[i];

    if (v == '\n' || v.isEmpty) continue;

    lastSymbolArg = v == argEnum.last ? ';' : ',';
    constructor.write('''
  $v('$v')$lastSymbolArg
''');
    fromValue.write('''
      case '$v':
        return $v;
''');

    mapStart.write('''
    required T Function() $v,
''');

    mapEnd.write('''
      case $nameEnum.$v:
        return $v();     
''');
    maybeMapStart.write('''
    T Function()? $v,
''');

    maybeMapEnd.write('''
      $v: $v ?? orElse,     
''');

    maybeMapOrNullStart.write('''
    T Function()? $v,
''');

    maybeMapOrNullEnd.write('''
        $v: $v,  
''');
  }

  final file = File(path);

  file.writeAsString('''
  // ignore_for_file: constant_identifier_names, non_constant_identifier_names, lines_longer_than_80_chars
  /*
  $contentFile
  */
  
  //  ******************************
  // GENERATED CODE BELOW - DO NOT MODIFY
  //  ******************************

enum $nameEnum with Comparable<$nameEnum> { 
${constructor.toString()}
  const $nameEnum(this.value);

  final String value;

  static $nameEnum fromValue(
    String? value, {
    $nameEnum? fallback,
  }) {
    switch (value) {
${fromValue.toString()}
      default:
        return fallback ?? (throw ArgumentError.value(value));
    }
  }

  /// Pattern matching
  T map<T>({
${mapStart.toString()}
  }) {
    switch (this) {
${mapEnd.toString()}
    }
  }
  
  /// Pattern matching
  T maybeMap<T>({
    required T Function() orElse,
${maybeMapStart.toString()}
  }) =>
      map<T>(
${maybeMapEnd.toString()}
      );

  /// Pattern matching
  T? maybeMapOrNull<T>({
${maybeMapOrNullStart.toString()}
  }) =>
      maybeMap<T?>(
        orElse: () => null,
${maybeMapOrNullEnd.toString()}        
      );

  @override
  int compareTo($nameEnum other) => index.compareTo(other.index);

  @override
  String toString() => value;
   }\n''');

  print('***');
  print(
      '✓ Successfully generated extra features for enum with default value');
  print('***');

}

String findText(
    {required String oldContent, required String start, required String end}) {
  final startIndex = oldContent.indexOf(start.trim());
  final endIndex = oldContent.indexOf(end.trim(), startIndex + start.length);

  return oldContent
      .substring(startIndex + start.length, endIndex)
      .replaceAll(' ', '');
}

Future<String> readFile({required File file}) async {
  try {
    // Read the file
    final contents = await file.readAsString();

    return contents;
  } catch (e) {
    return 'ERROR $e';
  }
}
