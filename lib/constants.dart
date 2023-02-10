// ignore_for_file: constant_identifier_names
import 'package:path/path.dart' as path;
String introMessage(String currentVersion) => '''

  ════════════════════════════════════════════
     DART GEN EXTRA (v$currentVersion)                               
  ════════════════════════════════════════════''';

const String GEN_MSG = '''
//          --DartGenExtra--
//  *************************************
// GENERATED CODE BELOW - DO NOT MODIFY
//  *************************************
  ''';
  
/// Relative pubspec.yaml path
String pubspecFilePath = path.join('pubspec.yaml');

/// Relative pubspec.yaml path
String namePackage = 'dart_gen_extra';