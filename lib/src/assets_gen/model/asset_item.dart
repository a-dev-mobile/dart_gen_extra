// ignore_for_file: sort_constructors_first
import 'dart:convert';

import '../enum_type_assets.dart';

class AssetItem {
  /* type: enum
  init: EnumTypeAssets.none
   */
  final EnumTypeAssets type;
/*  init: '' */
  final String filePath;
  /*  init: '' */
  final String fileName;
  /*  init: '' */
  final String fileFormatName;
  /*  init: '' */
  final String fileExtension;

  // end

  //  ******************************
  // GENERATED CODE BELOW - DO NOT MODIFY
  //  ******************************

  const AssetItem({
    this.type = EnumTypeAssets.none,
    this.filePath = '',
    this.fileName = '',
    this.fileFormatName = '',
    this.fileExtension = '',
  });
  /*
  
   factory AssetItem.init() => AssetItem(
      ); 
  */

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'type': type.index,
      'filePath': filePath,
      'fileName': fileName,
      'fileFormatName': fileFormatName,
      'fileExtension': fileExtension,
    };
  }

  factory AssetItem.fromMap(Map<String, dynamic> map) {
    return AssetItem(
      type: EnumTypeAssets.values[map['type'] as int],
      filePath: map['filePath'] as String? ?? '',
      fileName: map['fileName'] as String? ?? '',
      fileFormatName: map['fileFormatName'] as String? ?? '',
      fileExtension: map['fileExtension'] as String? ?? '',
    );
  }

  AssetItem copyWith({
    EnumTypeAssets? type,
    String? filePath,
    String? fileName,
    String? fileFormatName,
    String? fileExtension,
  }) {
    return AssetItem(
      type: type ?? this.type,
      filePath: filePath ?? this.filePath,
      fileName: fileName ?? this.fileName,
      fileFormatName: fileFormatName ?? this.fileFormatName,
      fileExtension: fileExtension ?? this.fileExtension,
    );
  }

  String toJson() => json.encode(toMap());

  factory AssetItem.fromJson(String source) =>
      AssetItem.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AssetItem &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.filePath, filePath) ||
                other.filePath == filePath) &&
            (identical(other.fileName, fileName) ||
                other.fileName == fileName) &&
            (identical(other.fileFormatName, fileFormatName) ||
                other.fileFormatName == fileFormatName) &&
            (identical(other.fileExtension, fileExtension) ||
                other.fileExtension == fileExtension));
  }

  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        type,
        filePath,
        fileName,
        fileFormatName,
        fileExtension,
      ]);

  @override
  String toString() {
    return 'AssetItem(type: $type, filePath: $filePath, fileName: $fileName, fileFormatName: $fileFormatName, fileExtension: $fileExtension, )';
  }
}
