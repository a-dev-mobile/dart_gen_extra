import 'dart:io';
import 'package:path/path.dart' as p;
// ignore: depend_on_referenced_packages
import 'package:dart_gen_extra/logger.dart';
import 'package:dart_gen_extra/utils.dart';

Future<void> runAssetsSvg(
    {required String path, required FLILogger logger}) async {
  final pathAssetsFolderExamp1 = p.join(path, 'assets');
  final pathAssetsFolderExamp2 = p.join(path, 'asset');

  String pathAssets = '';
  if (await _isExistFolder(pathAssetsFolderExamp1)) {
    pathAssets = pathAssetsFolderExamp1;
  } else if (await _isExistFolder(pathAssetsFolderExamp2)) {
    pathAssets = pathAssetsFolderExamp2;
  } else {
    logger.error('assets folder not found');
    exit(0);
  }

  logger.info('assets folder found: $pathAssets');

  final allFiles = Directory(pathAssets)
      .listSync(recursive: true)
      .whereType<File>()
      .toList();
  final svgFiles = <String>[];
  final ttfFiles = <String>[];
  final jsonFiles = <String>[];
  final pdfFiles = <String>[];
  final pngFiles = <String>[];

  for (var v in allFiles) {
    switch (p.extension(v.path)) {
      case '.svg':
        svgFiles.add(v.path);
        break;
      case '.ttf':
        ttfFiles.add(v.path);
        break;
      case '.json':
        jsonFiles.add(v.path);
        break;
      case '.pdf':
        pdfFiles.add(v.path);
        break;
      case '.png':
        pngFiles.add(v.path);
        break;
    }
  }
  logger.info('');
  logger.info('files found:');

  logger.info('pdf:\t${pdfFiles.length}');
  logger.info('svg:\t${svgFiles.length}');
  logger.info('ttf:\t${ttfFiles.length}');
  logger.info('json:\t${jsonFiles.length}');
  logger.info('png:\t${pngFiles.length}');
  // print(allFiles);
  // print('');
  // print('');
  // print('');
  // print(svgFiles);
}

Future<bool> _isExistFolder(String path) async {
  return await Directory(path).exists();
}

Future<List<File>> getAllFilesWithExtension(
    String path, String extension) async {
  final List<FileSystemEntity> entities = await Directory(path).list().toList();
  return entities
      .whereType<File>()
      .where((element) => p.extension(element.path) == extension)
      .toList();
}
