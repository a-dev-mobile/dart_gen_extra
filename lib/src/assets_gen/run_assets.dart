import 'dart:io';
import 'package:basic_utils/basic_utils.dart';
import 'package:dart_gen_extra/src/assets_gen/model/asset_item.dart';
import 'package:dart_gen_extra/src/assets_gen/enum_type_assets.dart';
import 'package:path/path.dart' as p;
// ignore: depend_on_referenced_packages
import 'package:dart_gen_extra/logger.dart';

Future<void> runAssets(
    {required String path, required FLILogger logger}) async {
  logger.progress('\nLooking for the assets folder');

  final pathAssetsFolderExamp1 = p.join(path, 'assets');
  final pathAssetsFolderExamp2 = p.join(path, 'asset');

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

  String filePatch = '';
  String fileExtension = '';
  String fileName = '';
  EnumTypeAssets type = EnumTypeAssets.none;
  final assetsList = <AssetItem>[];

  for (var v in allFiles) {
    filePatch = v.path;
    fileExtension = p.extension(filePatch);
    fileName = p.basename(filePatch).split('.').first;
    type =
        EnumTypeAssets.fromValue(fileExtension, fallback: EnumTypeAssets.none);

    assetsList.add(AssetItem(
        fileName: fileName,
        fileExtension: fileExtension,
        filePath: filePatch,
        type: type,
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
      print(v.filePath);
    }
  }
 
  for (var v in assetsList) {}

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
