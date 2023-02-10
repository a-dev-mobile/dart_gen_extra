import 'dart:io';
import 'package:dart_gen_extra/constants.dart';
import 'package:dart_gen_extra/gen/assets.gen.dart';
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

  final pathAssetsFolderExamp1 = p.join(pathBase, 'assets');
  final pathAssetsFolderExamp2 = p.join(pathBase, 'asset');

  String pathAssets = '';

  if (await _isExistFolder(pathAssetsFolderExamp1)) {
    pathAssets = pathAssetsFolderExamp1;
  } else if (await _isExistFolder(pathAssetsFolderExamp2)) {
    pathAssets = pathAssetsFolderExamp2;
  } else {
    logger.error('Assets folder not found');
    exit(0);
  }

  logger.info('\nAssets folder found: $pathAssets');
  logger.progress('\nReading the assets folder');
  logger.info('');

  final allFiles = Directory(pathAssets)
      .listSync(recursive: true)
      .whereType<File>()
      .toList();

  String fileFullPatch = '';
  String fileExtension = '';
  String fileName = '';
  EnumTypeAssets type = EnumTypeAssets.none;
  final assetsList = <AssetItem>[];

  for (var v in allFiles) {
    fileFullPatch = v.path;
    fileExtension = p.extension(fileFullPatch);
    fileName = p.basename(fileFullPatch).split('.').first;
    type =
        EnumTypeAssets.fromValue(fileExtension, fallback: EnumTypeAssets.none);

    assetsList.add(AssetItem(
        fileName: fileName,
        fileExtension: fileExtension,
        fileFullPath: fileFullPatch,
        type: type,
        fileFromAssetsPath: fileFullPatch
            .replaceAll(pathBase, '')
            .replaceAll('\\', '/')
            .replaceAll('/asset', 'asset'),
        fileFormatName: _formatFileName(fileName)));
  }

  logger.info('files found:');
  var lenght = 0;
  for (var type in EnumTypeAssets.values) {
    lenght = assetsList.where((v) => v.type == type).length;

    logger.info('${type.value}\t\t$lenght');
  }

  final fileNoneList = assetsList.where((v) => v.type == EnumTypeAssets.none);
  if (fileNoneList.isNotEmpty) {
    logger.info('\nFile format is not supported:');
    for (var v in fileNoneList) {
      print(v.fileFullPath);
    }
  }

  final pathGenFolder = getPathAssetsOutput(pathBase);
  if (pathGenFolder.isEmpty) {
    throw NoConfigFoundException(
      'No configuration found in ${constants.pubspecFilePath}. ',
    );
  }

  final pathGenFile = '${pathGenFolder}assets.gen.dart';
  await _createFolderAndFile(pathGenFolder, pathGenFile);

  StringBuffer sbFont = StringBuffer();

 
 
  
 
 
  final fontList = assetsList.where((v) => v.type == EnumTypeAssets.ttf);

  for (var v in fontList) {
    sbFont.write('''
/// File path: _${v.fileFromAssetsPath}
static const String ${v.fileFormatName} = '${v.fileFromAssetsPath}';

''');
  }

  StringBuffer sbImage = StringBuffer();
  final imageList = assetsList.where((v) => v.type == EnumTypeAssets.png);
  for (var v in imageList) {
    sbImage.write('''
/// File path: _${v.fileFromAssetsPath}
static const String ${v.fileFormatName} = '${v.fileFromAssetsPath}';

''');

    Assets.ttf;
  }

  File(pathGenFile).writeAsString('''
$GEN_MSG
class AssetsFont {
  static final AssetsFont _internalSingleton = AssetsFont._internal();
  factory AssetsFont() => _internalSingleton;
  AssetsFont._internal();

${sbFont.toString()}
}


class AssetsImage {
  static final AssetsImage _internalSingleton = AssetsImage._internal();
  factory AssetsImage() => _internalSingleton;
  AssetsImage._internal();

${sbImage.toString()}
}




''');

  // for (var v in assetsList) {}

  // logger.info('pdf:\t${pdfFiles.length}');
  // logger.info('svg:\t${svgFiles.length}');
  // logger.info('ttf:\t${ttfFiles.length}');
  // logger.info('json:\t${jsonFiles.length}');
  // logger.info('png:\t${pngFiles.length}');
  // print(allFiles);
  // print('');
  // print('');
  // print('');
  // print(svgFiles);
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
  final separatedWords = s.split(RegExp(r'[!@#<>?":`~;[\]\\|=+)(*&^%-\s_]+'));
  var newString = '';

  for (final word in separatedWords) {
    newString += word[0].toUpperCase() + word.substring(1).toLowerCase();
  }

  return '${newString[0].toLowerCase()}${newString.substring(1)}';
}

/// Loads dart gen_extra_config from `pubspec.yaml` file
String getPathAssetsOutput(String basePath) {
  final pubspecFile = File(p.join(basePath, constants.pubspecFilePath));
  if (!pubspecFile.existsSync()) {
    return '';
  }
  final content = pubspecFile.readAsStringSync();
  final userMap = loadYaml(content);

  if (userMap == null) return '';

  try {
    var relPath = (userMap['dart_gen_extra']['assets_output']).toString();

    return p.join(basePath, relPath);
  } on Exception {
    return '';
  }
}

extension YamlMapConverter on YamlMap {
  dynamic _convertNode(dynamic v) {
    if (v is YamlMap) {
      return (v).toMap();
    } else if (v is YamlList) {
      var list = <dynamic>[];
      for (var e in v) {
        list.add(_convertNode(e));
      }
      return list;
    } else {
      return v;
    }
  }

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{};
    nodes.forEach((k, v) {
      map[(k as YamlScalar).value.toString()] = _convertNode(v.value);
    });
    return map;
  }
}
