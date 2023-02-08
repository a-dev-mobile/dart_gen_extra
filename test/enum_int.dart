  // ignore_for_file:no-magic-number, constant_identifier_names, non_constant_identifier_names, lines_longer_than_80_chars
  /*
  enum NameIdEnum {
  vasia(25),
  petia(33),
  boria(5),
}

  */
  
  //  ******************************
  // GENERATED CODE BELOW - DO NOT MODIFY
  //  ******************************

enum NameIdEnum with Comparable<NameIdEnum> { 
  vasia(25),
  petia(33),
  boria(5);

  const NameIdEnum(this.value);

  final int value;

  static NameIdEnum fromValue(
    int? value, {
    NameIdEnum? fallback,
  }) {
    switch (value) {
      case 25:
        return vasia;
      case 33:
        return petia;
      case 5:
        return boria;

      default:
        return fallback ?? (throw ArgumentError.value(value));
    }
  }

  /// Pattern matching
  T map<T>({
    required T Function() vasia,
    required T Function() petia,
    required T Function() boria,

  }) {
    switch (this) {
      case NameIdEnum.vasia:
        return vasia();     
      case NameIdEnum.petia:
        return petia();     
      case NameIdEnum.boria:
        return boria();     

    }
  }
  
  /// Pattern matching
  T maybeMap<T>({
    required T Function() orElse,
    T Function()? vasia,
    T Function()? petia,
    T Function()? boria,

  }) =>
      map<T>(
      vasia: vasia ?? orElse,     
      petia: petia ?? orElse,     
      boria: boria ?? orElse,     

      );

  /// Pattern matching
  T? maybeMapOrNull<T>({
    T Function()? vasia,
    T Function()? petia,
    T Function()? boria,

  }) =>
      maybeMap<T?>(
        orElse: () => null,
        vasia: vasia,  
        petia: petia,  
        boria: boria,  
        
      );

  @override
  int compareTo(NameIdEnum other) => index.compareTo(other.index);

  @override
  String toString() => value.toString();
   }
