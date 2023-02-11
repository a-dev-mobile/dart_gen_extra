import 'dart:io';
import 'package:dart_gen_extra/constants.dart';

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
  Set<String> nameUniq = {};
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
      fileExtension = '';
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
      fileExtension = '';
    }

//  если нет имени используем расширение вместо имени
    // fileName = nameWithExten.first.isEmpty
    //     ? fileExtension.replaceAll('.', '')
    //     : nameWithExten.first;

    // // если нет расширения
    // if (fileName.isNotEmpty && fileExtension.isEmpty) {
    //   type = TypeNameFile.onlyName;
    // }
    fileOnlyNameFormat = _formatFileName(fileName);
    fileFromAssetsPath = fileFullPatch
        .replaceAll(pathBase, '')
        .replaceAll('\\', '/')
        .replaceAll('/asset', 'asset');
    assetsList.add(AssetItem(
        fileOnlyName: fileName,
        fileOnlyExtension: fileExtension,
        fileFullPath: fileFullPatch,
        type: type,
        fileFromAssetsPath: fileFromAssetsPath,
        fileOnlyNameFormat: fileOnlyNameFormat));
    type = TypeNameFile.init;
    extensionUniq.add(fileExtension);
    nameUniq.add(fileName);
  }
  for (var n in nameUniq) {
    final list = assetsList.where((i) => i.fileOnlyName == n).toList();
    if (list.length == 1) continue;

    for (var l in list) {
      assetsList.remove(l);
      assetsList.add(l.copyWith(type: TypeNameFile.identical));
    }
  }

  _foundFiles(logger, extensionUniq, assetsList);

  _foundFilesWithoutExtension(assetsList, logger);

  final pathGenFolder = _getPathAssetsOutput(pathBase);

  _sendErrorIfNotConfigInPubspec(pathGenFolder);

  final pathGenFile = '${pathGenFolder}assets.gen.dart';
  await _createFolderAndFile(pathGenFolder, pathGenFile);

  StringBuffer sbMain = StringBuffer();
  String vFormat = '';
  for (var v in extensionUniq) {
    if (v.isEmpty) continue;
    vFormat = _extensionFormat(v);

    sbMain.write('''
  static const \$Assets_$vFormat $vFormat = \$Assets_$vFormat();
''');
  }

  StringBuffer sbSub = StringBuffer();
  var listAssets = <AssetItem>[];
  final listStrNameFile = <String>[];
  for (var v in extensionUniq) {
    vFormat = _extensionFormat(v);
    sbSub.write('''

class \$Assets_$vFormat {
  const \$Assets_$vFormat();

''');

    listAssets = assetsList.where((e) => e.fileOnlyExtension == v).toList();
    for (var l in listAssets) {
      //  заполняю чтобы дальше вывести полный список
      listStrNameFile.add(l.fileOnlyNameFormat);

      sbSub.write('''
  /// File path: _${l.fileFromAssetsPath}
  String get ${l.fileOnlyNameFormat} => '${l.fileFromAssetsPath}';

''');
    }

    sbSub.write('''
  /// List of all assets
  List<String> get values => ${listStrNameFile.toString()};
}
''');
    listStrNameFile.clear();
  }

  File(pathGenFile).writeAsString('''
$GEN_MSG

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

class Assets {
  Assets._();
${sbMain.toString()}}
${sbSub.toString()}
''');
}

String _extensionFormat(String v) => v.replaceAll('.', '').replaceAll('-', '_');

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
  var lenght = 0;
  for (var e in extensionUniq) {
    if (e.isEmpty) continue;
    lenght = assetsList.where((v) => v.fileOnlyExtension == e).length;
    logger.info('$lenght\t$e');
  }
  lenght = assetsList.where((v) => v.fileOnlyExtension == noExtension).length;
  logger.info('--');
  logger.info('No extension\t$lenght');
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

  for (final word in separatedWords) {
    if (word.isEmpty) continue;
    newString += word[0].toUpperCase() + word.substring(1).toLowerCase();
  }

  return '${newString[0].toLowerCase()}${newString.substring(1)}';
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
