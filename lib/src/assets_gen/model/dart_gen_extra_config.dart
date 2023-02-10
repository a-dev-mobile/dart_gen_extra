// ignore_for_file: sort_constructors_first, non_constant_identifier_names
import 'dart:convert';



/// A Config parsed
class DartGenExtraConfig {    
  /*  */
  final String android;

// end
   
  //  ******************************
  // GENERATED CODE BELOW - DO NOT MODIFY
  //  ******************************

  
  const DartGenExtraConfig({
    required this.android,
  });
  /*
  
   factory DartGenExtraConfig.init() => DartGenExtraConfig(
        android: '',
      ); 
  */

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'android': android, 
    };
  }

    
  factory DartGenExtraConfig.fromMap(Map<String, dynamic> map) {
    return DartGenExtraConfig(
      android: map['android'] as String, 
    );
  }

  DartGenExtraConfig copyWith({
    String? android,
  }) {
    return DartGenExtraConfig(
      android: android ?? this.android, 
    );
  }
  
  String toJson() => json.encode(toMap());
  
    
  factory DartGenExtraConfig.fromJson(String source) => DartGenExtraConfig.fromMap(json.decode(source) as Map<String, dynamic>);
  
  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DartGenExtraConfig &&
            (identical(other.android, android) || other.android == android));
  }
  
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        android,
]);
  
  @override
  String toString() {
    return 'DartGenExtraConfig(android: $android, )';
    }
  }
