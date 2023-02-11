import 'dart:io';
import 'dart:math';
import 'package:dart_gen_extra/constants.dart';

import 'package:intl/intl.dart';

import 'package:yaml/yaml.dart';
import 'package:dart_gen_extra/constants.dart' as constants;
import 'package:dart_gen_extra/custom_exceptions.dart';
import 'package:dart_gen_extra/src/assets_gen/model/asset_item.dart';
import 'package:dart_gen_extra/src/assets_gen/enum_type_assets.dart';
import 'package:path/path.dart' as p;
// ignore: depend_on_referenced_packages
import 'package:dart_gen_extra/logger.dart';

Future<void> runAssets(
    {required String pathBase, required FLILogger logger}) async {
  logger.progress('\nLooking for the assets folder');

  final pathAssets = await _searchFolderAssets(pathBase, logger);

  logger.info('\nAssets folder found: $pathAssets');
  logger.progress('\nReading the assets folder');
  logger.info('');

  final allFiles = Directory(pathAssets)
      .listSync(recursive: true)
      .whereType<File>()
      .toList();

  String fileFullPatch = '';
  String fileNameWithExtension = '';
  String fileExtension = '';
  String fileName = '';
  String fileOnlyNameFormat = '';
  String fileFromAssetsPath = '';

  TypeNameFile type = TypeNameFile.init;
  final assetsList = <AssetItem>[];
  Set<String> extensionUniq = {};

  List<String> nameFormatList = [];
  for (var v in allFiles) {
    fileFullPatch = v.path;

    fileNameWithExtension = fileFullPatch.split('\\').last;
    final fileNameWithExtensionSplit = fileNameWithExtension.split('.');
    // если есть больше одной точки в имени файла
    if (fileNameWithExtensionSplit.length >= 3) {
      fileExtension = fileNameWithExtensionSplit.last;
      fileName = fileNameWithExtension.replaceAll(fileExtension, '');

      type = TypeNameFile.notNormal;
      // если нет имени но есть расширение
    } else if (fileNameWithExtensionSplit.length == 2 &&
        fileNameWithExtensionSplit.first.isEmpty) {
      type = TypeNameFile.onlyExtension;
      fileName = fileNameWithExtensionSplit.last;
      fileExtension = fileNameWithExtensionSplit.last;
      // если нет расширения
    } else if (fileNameWithExtensionSplit.length == 2 &&
        fileNameWithExtensionSplit.last.isEmpty) {
      fileName = fileNameWithExtensionSplit.first;
      fileExtension = noExtension;
      type = TypeNameFile.onlyName;
      // если  имя с расширением
    } else if (fileNameWithExtensionSplit.length == 2 &&
        fileNameWithExtensionSplit.last.isNotEmpty &&
        fileNameWithExtensionSplit.first.isNotEmpty) {
      fileName = fileNameWithExtensionSplit.first;
      fileExtension = fileNameWithExtensionSplit.last;

      type = TypeNameFile.normal;
    } else if (fileNameWithExtensionSplit.length == 1) {
      type = TypeNameFile.onlyName;
      fileName = fileNameWithExtensionSplit.first;
      fileExtension = noExtension;
    }

//  переименовываем если название файлов одинаково
    fileOnlyNameFormat = _formatFileName(fileName);

    for (var i = 0; i < 2000; i++) {
      if (nameFormatList.contains(fileOnlyNameFormat)) {
        type = TypeNameFile.identical;
        fileOnlyNameFormat = _incrNameFile(fileOnlyNameFormat);
      } else {
        break;
      }
    }
    nameFormatList.add(fileOnlyNameFormat);
    final stat = FileStat.statSync(fileFullPatch);
    fileFromAssetsPath =
        fileFullPatch.replaceAll(pathBase, '').replaceAll('\\', '/').substring(1);
    // .replaceAll('/asset', 'asset');
    assetsList.add(AssetItem(
        fileOnlyName: fileName,
        fileOnlyExtension: fileExtension,
        fileFullPath: fileFullPatch,
        type: type,
        fileFromAssetsPath: fileFromAssetsPath,
        fileNameWithExtension: fileNameWithExtension,
        size: await _getFileSize(fileFullPatch, 1),
        dateAccessed: _getDateFormat(stat.accessed),
        dateModified: _getDateFormat(stat.modified),
        dateChanged: _getDateFormat(stat.changed),
        fileOnlyNameFormat: fileOnlyNameFormat));
    type = TypeNameFile.init;
    extensionUniq.add(fileExtension);
    // nameList.add(fileName);
  }
  for (var n in nameFormatList.toSet().toList()) {
    final list = assetsList.where((i) => i.fileOnlyName == n).toList();
    if (list.length == 1) continue;

    for (var l in list) {
      assetsList.remove(l);
      assetsList.add(l.copyWith(type: TypeNameFile.identical));
    }
  }

  _errorIfNotFiles(assetsList, logger);

  _foundFiles(logger, extensionUniq, assetsList);

  _foundFilesWithoutExtension(assetsList, logger);

  final pathGenFolder = _getPathAssetsOutput(pathBase);

  _sendErrorIfNotConfigInPubspec(pathGenFolder);

  final pathGenFile = '${pathGenFolder}assets.gen.dart';
  await _createFolderAndFile(pathGenFolder, pathGenFile);

//   StringBuffer sbMain = StringBuffer();
//   for (var v in extensionUniq) {
//     if (v.isEmpty) continue;
//     vFormat = _extensionFormat(v);

//     sbMain.write('''
//   static const \$Assets_$vFormat $vFormat = \$Assets_$vFormat();
// ''');
//   }

  String vFormat = '';
  StringBuffer sbSub = StringBuffer();
  var listAssets = <AssetItem>[];
  final listStrNameFile = <String>[];
  for (var v in extensionUniq) {
    vFormat = _extensionFormat(v);
    sbSub.write('''

class AppAssets$vFormat {''');

    listAssets = assetsList.where((e) => e.fileOnlyExtension == v).toList();
    for (var l in listAssets) {
      //  заполняю чтобы дальше вывести полный список
      listStrNameFile.add(l.fileOnlyNameFormat);

      sbSub.write('''
 
  /// * Size:\t${l.size}.
  /// * File path: _${l.fileFromAssetsPath}.
  ///     * Accessed: ${l.dateAccessed}.
  ///     * Changed:  ${l.dateChanged}.
  ///     * Modified: ${l.dateModified}.
  static const String ${l.fileOnlyNameFormat} = '${l.fileFromAssetsPath}';
''');
    }
    // AppAssetsJSON.cardPhoto;
    sbSub.write('''

  /// List of all assets
  static const List<String> values = ${listStrNameFile.toString()};
}
''');
    listStrNameFile.clear();
  }

  File(pathGenFile).writeAsString('''
$GEN_MSG
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use
${sbSub.toString()}

''');

  print('***');
  print('✓ Successfully generated extra features for assets');
  print('***');
}

void _errorIfNotFiles(List<AssetItem> assetsList, FLILogger logger) {
  if (assetsList.isEmpty) {
    logger.error('Files in assets not found');
    exit(0);
  }
}

String _getDateFormat(DateTime date) {
  return DateFormat('yyyy-MM-dd').format(date);
}

String _extensionFormat(String v) {
  return v.replaceAll('.', '').replaceAll('-', '_').toUpperCase();
}

void _foundFilesWithoutExtension(List<AssetItem> assetsList, FLILogger logger) {
  final fileNoneList =
      assetsList.where((v) => v.fileOnlyExtension == noExtension);
  if (fileNoneList.isNotEmpty) {
    logger.info('\nFile without an extension:');
    for (var v in fileNoneList) {
      print(v.fileFullPath);
    }
  }
}

Future<String> _getFileSize(String filepath, int decimals) async {
  var file = File(filepath);
  int bytes = await file.length();
  if (bytes <= 0) return "0 B";
  const suffixes = ["B", "KB", "MB", "GB", "TB", "PB", "EB", "ZB", "YB"];
  var i = (log(bytes) / log(1024)).floor();
  return '${(bytes / pow(1024, i)).toStringAsFixed(decimals)} ${suffixes[i]}';
}

void _foundFilesWithoutName(List<AssetItem> assetsList, FLILogger logger) {
  final fileNoneList =
      assetsList.where((v) => v.fileOnlyExtension == noExtension);
  if (fileNoneList.isNotEmpty) {
    logger.info('\nFiles without a name:');
    for (var v in fileNoneList) {
      print(v.fileFullPath);
    }
  }
}

void _sendErrorIfNotConfigInPubspec(String pathGenFolder) {
  if (pathGenFolder.isEmpty) {
    throw NoConfigFoundException(
      '''No configuration found in ${constants.pubspecFilePath}. 
  # example:
  
  dart_gen_extra:
  assets_output: "lib/gen/"
  ''',
    );
  }
}

void _foundFiles(
    FLILogger logger, Set<String> extensionUniq, List<AssetItem> assetsList) {
  logger.info('files found:');
  logger.info('---');
  logger.info('total\textension');
  logger.info('---');
  var lenght = 0;
  for (var e in extensionUniq) {
    if (e.isEmpty || e == noExtension) continue;
    lenght = assetsList.where((v) => v.fileOnlyExtension == e).length;
    logger.info('$lenght\t$e');
  }
  lenght = assetsList.where((v) => v.fileOnlyExtension == noExtension).length;
  logger.info('---');
  logger.info('$lenght\tNo extension');
}

Future<String> _searchFolderAssets(String pathBase, FLILogger logger) async {
  final pathAssetsFolderExamp1 = p.join(pathBase, 'assets');
  final pathAssetsFolderExamp2 = p.join(pathBase, 'asset');
  if (await _isExistFolder(pathAssetsFolderExamp1)) {
    return pathAssetsFolderExamp1;
  } else if (await _isExistFolder(pathAssetsFolderExamp2)) {
    return pathAssetsFolderExamp2;
  } else {
    logger.error('Assets folder not found');
    exit(0);
  }
}

Future<void> _createFolderAndFile(
    String pathGenFolder, String pathGenFile) async {
  await Directory(pathGenFolder).create(recursive: true);
  File file = File(pathGenFile);
  await file.create();
}

Future<bool> _isExistFolder(String path) async {
  return await Directory(path).exists();
}

String _formatFileName(String s) {
  s = s.replaceAll('.', '_');

  final separatedWords = s.split(RegExp(r'[!@#<>?":`~;[\]\\|=+)(*&^%-\s_]+'));
  var newString = '';

  if (separatedWords[0].isEmpty ||
      int.tryParse(separatedWords[0]) != null ||
      int.tryParse(separatedWords[0][0]) != null) separatedWords[0] = 'n';

  for (final word in separatedWords) {
    if (word.isEmpty) continue;
    newString += word[0].toUpperCase() + word.substring(1).toLowerCase();
  }
  final text = '${newString[0].toLowerCase()}${newString.substring(1)}';
  return text == 'values' ? 'vValues' : text;
}

/// Loads dart gen_extra_config from `pubspec.yaml` file
String _getPathAssetsOutput(String basePath) {
  final pubspecFile = File(p.join(basePath, constants.pubspecFilePath));
  if (!pubspecFile.existsSync()) {
    return '';
  }
  final content = pubspecFile.readAsStringSync();
  final userMap = loadYaml(content);

  if (userMap == null) return '';

  try {
    final configName = userMap['dart_gen_extra'];
    if (configName == null) return '';
    final configValue = configName['assets_output'];
    if (configValue == null) return '';

    var relPath = (userMap['dart_gen_extra']['assets_output']).toString();

    return p.join(basePath, relPath);
  } on Exception {
    return '';
  }
}

String _incrNameFile(String text) {
  final intInStr = RegExp(r'\d+$');
  final listMath = intInStr.allMatches(text).map((m) => m.group(0));
  final defValue = '${text}1';
  if (listMath.isEmpty) return defValue;

  int? i = int.tryParse(listMath.first ?? '');

  if (i == null) return defValue;

  i = i + 1;
  String updateText = text.replaceAll(intInStr, '');

  return '$updateText$i';
}
