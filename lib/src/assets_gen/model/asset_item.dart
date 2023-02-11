// ignore_for_file: sort_constructors_first
import 'dart:convert';

import '../enum_type_assets.dart';

class AssetItem { 
  /* 
  type: enum
  init: TypeNameFile.init
   */
  final TypeNameFile type;
/*  init: '' */
  final String fileFullPath;
  /*  init: '' */
  final String fileFromAssetsPath;
  /*  init: '' */
  final String fileOnlyName;
  /*  init: '' */
  final String fileOnlyNameFormat;
  /*  init: '' */
  final String fileOnlyExtension;
  /*  init: '' */
  final String fileNameWithExtension;
  // end
   
  //  ******************************
  // GENERATED CODE BELOW - DO NOT MODIFY
  //  ******************************

  
  const AssetItem({
    this.type = TypeNameFile.init,
    this.fileFullPath = '',
    this.fileFromAssetsPath = '',
    this.fileOnlyName = '',
    this.fileOnlyNameFormat = '',
    this.fileOnlyExtension = '',
    this.fileNameWithExtension = '',
  });
  /*
  
   factory AssetItem.init() => AssetItem(
      ); 
  */

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'type': type.index, 
      'fileFullPath': fileFullPath, 
      'fileFromAssetsPath': fileFromAssetsPath, 
      'fileOnlyName': fileOnlyName, 
      'fileOnlyNameFormat': fileOnlyNameFormat, 
      'fileOnlyExtension': fileOnlyExtension, 
      'fileNameWithExtension': fileNameWithExtension, 
    };
  }

    
  factory AssetItem.fromMap(Map<String, dynamic> map) {
    return AssetItem(
      type: TypeNameFile.values[map['type'] as int], 
      fileFullPath: map['fileFullPath'] as String? ?? '' , 
      fileFromAssetsPath: map['fileFromAssetsPath'] as String? ?? '' , 
      fileOnlyName: map['fileOnlyName'] as String? ?? '' , 
      fileOnlyNameFormat: map['fileOnlyNameFormat'] as String? ?? '' , 
      fileOnlyExtension: map['fileOnlyExtension'] as String? ?? '' , 
      fileNameWithExtension: map['fileNameWithExtension'] as String? ?? '' , 
    );
  }

  AssetItem copyWith({
    TypeNameFile? type,
    String? fileFullPath,
    String? fileFromAssetsPath,
    String? fileOnlyName,
    String? fileOnlyNameFormat,
    String? fileOnlyExtension,
    String? fileNameWithExtension,
  }) {
    return AssetItem(
      type: type ?? this.type, 
      fileFullPath: fileFullPath ?? this.fileFullPath, 
      fileFromAssetsPath: fileFromAssetsPath ?? this.fileFromAssetsPath, 
      fileOnlyName: fileOnlyName ?? this.fileOnlyName, 
      fileOnlyNameFormat: fileOnlyNameFormat ?? this.fileOnlyNameFormat, 
      fileOnlyExtension: fileOnlyExtension ?? this.fileOnlyExtension, 
      fileNameWithExtension: fileNameWithExtension ?? this.fileNameWithExtension, 
    );
  }
  
  String toJson() => json.encode(toMap());
  
    
  factory AssetItem.fromJson(String source) => AssetItem.fromMap(json.decode(source) as Map<String, dynamic>);
  
  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AssetItem &&
            (identical(other.type, type) || other.type == type)&& 
            (identical(other.fileFullPath, fileFullPath) || other.fileFullPath == fileFullPath)&& 
            (identical(other.fileFromAssetsPath, fileFromAssetsPath) || other.fileFromAssetsPath == fileFromAssetsPath)&& 
            (identical(other.fileOnlyName, fileOnlyName) || other.fileOnlyName == fileOnlyName)&& 
            (identical(other.fileOnlyNameFormat, fileOnlyNameFormat) || other.fileOnlyNameFormat == fileOnlyNameFormat)&& 
            (identical(other.fileOnlyExtension, fileOnlyExtension) || other.fileOnlyExtension == fileOnlyExtension)&& 
            (identical(other.fileNameWithExtension, fileNameWithExtension) || other.fileNameWithExtension == fileNameWithExtension));
  }
  
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        type,
        fileFullPath,
        fileFromAssetsPath,
        fileOnlyName,
        fileOnlyNameFormat,
        fileOnlyExtension,
        fileNameWithExtension,
]);
  
  @override
  String toString() {
    return 'AssetItem(type: $type, fileFullPath: $fileFullPath, fileFromAssetsPath: $fileFromAssetsPath, fileOnlyName: $fileOnlyName, fileOnlyNameFormat: $fileOnlyNameFormat, fileOnlyExtension: $fileOnlyExtension, fileNameWithExtension: $fileNameWithExtension, )';
    }
  }
