import 'package:path/path.dart' as path;


String introMessage(String currentVersion) => '''

  ════════════════════════════════════════════
     DART GEN EXTRA (v$currentVersion)                               
  ════════════════════════════════════════════
  ''';
/// Relative pubspec.yaml path
String pubspecFilePath = path.join('pubspec.yaml');