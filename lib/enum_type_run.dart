  // ignore_for_file: constant_identifier_names, non_constant_identifier_names, lines_longer_than_80_chars
  /*
  enum EnumTypeRun {
  enumDefault('enum_default'),
  enumInt('enum_int'),
  enumString('enum_string'),
  data('data'),
  none('none'),
}

  */
  
  //  ******************************
  // GENERATED CODE BELOW - DO NOT MODIFY
  //  ******************************

enum EnumTypeRun with Comparable<EnumTypeRun> { 
  enumDefault('enum_default'),
  enumInt('enum_int'),
  enumString('enum_string'),
  data('data'),
  none('none');

  const EnumTypeRun(this.value);

  final String value;

  static EnumTypeRun fromValue(
    String? value, {
    EnumTypeRun? fallback,
  }) {
    switch (value) {
      case 'enum_default':
        return enumDefault;
      case 'enum_int':
        return enumInt;
      case 'enum_string':
        return enumString;
      case 'data':
        return data;
      case 'none':
        return none;

      default:
        return fallback ?? (throw ArgumentError.value(value));
    }
  }

  /// Pattern matching
  T map<T>({
    required T Function() enumDefault,
    required T Function() enumInt,
    required T Function() enumString,
    required T Function() data,
    required T Function() none,

  }) {
    switch (this) {
      case EnumTypeRun.enumDefault:
        return enumDefault();     
      case EnumTypeRun.enumInt:
        return enumInt();     
      case EnumTypeRun.enumString:
        return enumString();     
      case EnumTypeRun.data:
        return data();     
      case EnumTypeRun.none:
        return none();     

    }
  }
  
  /// Pattern matching
  T maybeMap<T>({
    required T Function() orElse,
    T Function()? enumDefault,
    T Function()? enumInt,
    T Function()? enumString,
    T Function()? data,
    T Function()? none,

  }) =>
      map<T>(
      enumDefault: enumDefault ?? orElse,     
      enumInt: enumInt ?? orElse,     
      enumString: enumString ?? orElse,     
      data: data ?? orElse,     
      none: none ?? orElse,     

      );

  /// Pattern matching
  T? maybeMapOrNull<T>({
    T Function()? enumDefault,
    T Function()? enumInt,
    T Function()? enumString,
    T Function()? data,
    T Function()? none,

  }) =>
      maybeMap<T?>(
        orElse: () => null,
        enumDefault: enumDefault,  
        enumInt: enumInt,  
        enumString: enumString,  
        data: data,  
        none: none,  
        
      );

  @override
  int compareTo(EnumTypeRun other) => index.compareTo(other.index);

  @override
  String toString() => value;
   }
