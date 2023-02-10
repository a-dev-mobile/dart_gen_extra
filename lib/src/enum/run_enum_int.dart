import 'dart:io';

// ignore: depend_on_referenced_packages
import 'package:dart_gen_extra/constants.dart';
import 'package:dart_gen_extra/logger.dart';
import 'package:dart_gen_extra/utils.dart';

/* 
генерируется в одном файле 
fromValue
T map<T>
T maybeMap<T>
T? maybeMapOrNull<T>

в отдельном файле должен указать enum со значениями по умолчанию

например без конструктора

enum LocaleEnum {
  ru('ru_RU'),
  en('en_US'),
}

или с конструктором

enum LocaleEnum {
  ru('ru_RU'),
  en('en_US');

  const LocaleEnum(this.value);

  final String value;
}

переносы должны быть указаны как >>>  LF
 */

Future<void> runEnumInt(
    {required String path, required FLILogger logger}) async {
  String contentFile = await UtilsString.readFile(path: path);

  if (contentFile.contains('GENERATED CODE')) {
    logger.info('Файл $path \nуже имеет генерированные данные');
    return;
  }

  String enumContent = UtilsString.replaceToEmpty(
    text: UtilsRegex.getTextRegexLastMatch(
        content: contentFile, regex: r'enum\s+\w+\s+{[\s\S]+?}'),
    replaceable: [
      '\n',
      '  ',
    ],
  );

  final enumHeader = UtilsRegex.getTextRegexLastMatch(
      content: enumContent, regex: r'enum\s+\w+\s+{');

  final enumName = UtilsString.replaceToEmpty(
    text: enumHeader,
    replaceable: [
      'enum',
      ' ',
      '{',
    ],
  );

  final enumBrackets = UtilsString.replaceToEmpty(
    text: enumContent,
    replaceable: [
      enumHeader,
      '}',
    ],
  );
  String enumBracketsWithoutFinalAndConst = enumBrackets;

  if (enumBrackets.contains('const') && enumBrackets.contains('final')) {
    enumBracketsWithoutFinalAndConst = UtilsString.replaceToEmpty(
      text: enumBrackets,
      replaceable: [
        UtilsRegex.getTextRegexLastMatch(
            content: enumContent, regex: r'const[\s\S]+?;'),
        UtilsRegex.getTextRegexLastMatch(
            content: enumContent, regex: r'final[\s\S]+?;'),
      ],
    );
  }
  final listItemValue = UtilsRegex.getTextRegexListMatch(
      content: enumBracketsWithoutFinalAndConst, regex: r'\([\s\S]+?\)');

  final listItemName = UtilsRegex.getTextRegexListMatch(
      content: enumBracketsWithoutFinalAndConst, regex: r'\w+(\s+|)\(');
  String key = '';
  String value = '';
  final map = <String, String>{};

  for (int i = 0; i < listItemName.length; i++) {
    key = UtilsString.replaceToEmpty(text: listItemName[i], replaceable: [
      '(',
    ]);
    value = UtilsString.replaceToEmpty(text: listItemValue[i], replaceable: [
      '(',
      ')',
      '\'',
      '"',
    ]);
    map[key] = value;
  }

  StringBuffer constructor = StringBuffer();
  StringBuffer fromValue = StringBuffer();

  /// Pattern matching
  StringBuffer mapStart = StringBuffer();
  StringBuffer mapEnd = StringBuffer();
  StringBuffer maybeMapStart = StringBuffer();
  StringBuffer maybeMapEnd = StringBuffer();
  StringBuffer maybeMapOrNullStart = StringBuffer();
  StringBuffer maybeMapOrNullEnd = StringBuffer();
  String lastSymbolArg = '';
  map.forEach((k, v) {
    {
      lastSymbolArg = k == map.keys.last ? ';' : ',';
      constructor.write('''
  $k($v)$lastSymbolArg
''');
      fromValue.write('''
      case $v:
        return $k;
''');

      mapStart.write('''
    required T Function() $k,
''');

      mapEnd.write('''
      case $enumName.$k:
        return $k();     
''');
      maybeMapStart.write('''
    T Function()? $k,
''');

      maybeMapEnd.write('''
      $k: $k ?? orElse,     
''');

      maybeMapOrNullStart.write('''
    T Function()? $k,
''');

      maybeMapOrNullEnd.write('''
        $k: $k,  
''');
    }
  });

  final file = File(path);

  file.writeAsString('''
  // ignore_for_file:no-magic-number, constant_identifier_names, non_constant_identifier_names, lines_longer_than_80_chars
  /*
  $contentFile
  */
  
$GEN_MSG

enum $enumName with Comparable<$enumName> { 
${constructor.toString()}
  const $enumName(this.value);

  final int value;

  static $enumName fromValue(
    int? value, {
    $enumName? fallback,
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
  int compareTo($enumName other) => index.compareTo(other.index);

  @override
  String toString() => value.toString();
   }\n''');

  print('***');
  print('✓ Successfully generated extra features for enum with int value');

  print('***');
}
