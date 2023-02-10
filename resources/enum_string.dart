  // ignore_for_file: constant_identifier_names, non_constant_identifier_names, lines_longer_than_80_chars
  /*
  enum TypeVarable {
  list_bool_('List<bool>'),
  list_int('List<int>'),
  list_string('List<String>'),
  list_double('List<double>')
}

  */
  
//          --DartGenExtra--
//  *************************************
// GENERATED CODE BELOW - DO NOT MODIFY
//  *************************************
  

enum TypeVarable with Comparable<TypeVarable> { 
  list_bool_('List<bool>'),
  list_int('List<int>'),
  list_string('List<String>'),
  list_double('List<double>');

  const TypeVarable(this.value);

  final String value;

  static TypeVarable fromValue(
    String? value, {
    TypeVarable? fallback,
  }) {
    switch (value) {
      case 'List<bool>':
        return list_bool_;
      case 'List<int>':
        return list_int;
      case 'List<String>':
        return list_string;
      case 'List<double>':
        return list_double;

      default:
        return fallback ?? (throw ArgumentError.value(value));
    }
  }

  /// Pattern matching
  T map<T>({
    required T Function() list_bool_,
    required T Function() list_int,
    required T Function() list_string,
    required T Function() list_double,

  }) {
    switch (this) {
      case TypeVarable.list_bool_:
        return list_bool_();     
      case TypeVarable.list_int:
        return list_int();     
      case TypeVarable.list_string:
        return list_string();     
      case TypeVarable.list_double:
        return list_double();     

    }
  }
  
  /// Pattern matching
  T maybeMap<T>({
    required T Function() orElse,
    T Function()? list_bool_,
    T Function()? list_int,
    T Function()? list_string,
    T Function()? list_double,

  }) =>
      map<T>(
      list_bool_: list_bool_ ?? orElse,     
      list_int: list_int ?? orElse,     
      list_string: list_string ?? orElse,     
      list_double: list_double ?? orElse,     

      );

  /// Pattern matching
  T? maybeMapOrNull<T>({
    T Function()? list_bool_,
    T Function()? list_int,
    T Function()? list_string,
    T Function()? list_double,

  }) =>
      maybeMap<T?>(
        orElse: () => null,
        list_bool_: list_bool_,  
        list_int: list_int,  
        list_string: list_string,  
        list_double: list_double,  
        
      );

  @override
  int compareTo(TypeVarable other) => index.compareTo(other.index);

  @override
  String toString() => value;
   }
