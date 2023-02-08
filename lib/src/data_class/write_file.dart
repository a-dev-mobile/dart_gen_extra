part of 'run_data_class.dart';

void writeToFile(
    String contentFile,
    String classHeader,
    String className,
    String classBrackets,
    StringBuffer constructor,
    StringBuffer factoryInit,
    StringBuffer copyWithStart,
    StringBuffer copyWithEnd,
    StringBuffer toMapSb,
    StringBuffer fromMapSb,
    StringBuffer toString,
    StringBuffer equals,
    StringBuffer hashCode,
    File file) {
  String header = contentFile.split(classHeader).first;

  // final add4 = "@immutable";
  // if (!header.contains(add4)) {
  //   header = "\n$add4$header\n";
  // }
  if (header.contains("@immutable")) {
    final add3 = "import 'package:meta/meta.dart';";
    if (!header.contains(add3)) {
      header = "$add3\n$header";
    }
  }
  if (equals.toString().contains("DeepCollectionEquality")) {
    final add2 = "import 'package:collection/collection.dart';";
    if (!header.contains(add2)) {
      header = "$add2\n$header";
    }
  }

  final add1 = "import 'dart:convert';";
  if (!header.contains(add1)) {
    header = "$add1\n$header";
  }

  final add5 = "// ignore_for_file: sort_constructors_first";
  if (!header.contains(add5)) {
    header = "$add5\n$header";
  }

  final newContent = '''
${header}class $className { $classBrackets
   
  //  ******************************
  // GENERATED CODE BELOW - DO NOT MODIFY
  //  ******************************

  
  const $className({
${constructor.toString()}  });
  /*
  
   factory $className.init() => $className(
${factoryInit.toString()}      ); 
  */

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
${toMapSb.toString()}    };
  }

    
  factory $className.fromMap(Map<String, dynamic> map) {
    return $className(
${fromMapSb.toString()}    );
  }

  $className copyWith({
${copyWithStart.toString()}  }) {
    return $className(
${copyWithEnd.toString()}    );
  }
  
  String toJson() => json.encode(toMap());
  
    
  factory $className.fromJson(String source) => $className.fromMap(json.decode(source) as Map<String, dynamic>);
  
  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is $className &&
${equals.toString()}  }
  
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
${hashCode.toString()}]);
  
  @override
  String toString() {
    return '$className(${toString.toString()})';
    }
  }\n''';

  file.writeAsString(UtilsString.replaceToEmpty(
    text: newContent,
    replaceable: [],
  ));


  print('***');
  print('✓ Successfully generated extra features for data class');
  print('***');

}
