  // ignore_for_file: constant_identifier_names, non_constant_identifier_names, lines_longer_than_80_chars
  /*
  
  enum EnumTypeAssets {
  pdf('.pdf'),
  svg('.svg'),
  png('.png'),
  ttf('.ttf'),
  json('.json'),
  none('unknown'),
}
  */
  
  //  ******************************
  // GENERATED CODE BELOW - DO NOT MODIFY
  //  ******************************

enum EnumTypeAssets with Comparable<EnumTypeAssets> { 
  pdf('.pdf'),
  svg('.svg'),
  png('.png'),
  ttf('.ttf'),
  json('.json'),
  none('unknown');

  const EnumTypeAssets(this.value);

  final String value;

  static EnumTypeAssets fromValue(
    String? value, {
    EnumTypeAssets? fallback,
  }) {
    switch (value) {
      case '.pdf':
        return pdf;
      case '.svg':
        return svg;
      case '.png':
        return png;
      case '.ttf':
        return ttf;
      case '.json':
        return json;
      case 'unknown':
        return none;

      default:
        return fallback ?? (throw ArgumentError.value(value));
    }
  }

  /// Pattern matching
  T map<T>({
    required T Function() pdf,
    required T Function() svg,
    required T Function() png,
    required T Function() ttf,
    required T Function() json,
    required T Function() none,

  }) {
    switch (this) {
      case EnumTypeAssets.pdf:
        return pdf();     
      case EnumTypeAssets.svg:
        return svg();     
      case EnumTypeAssets.png:
        return png();     
      case EnumTypeAssets.ttf:
        return ttf();     
      case EnumTypeAssets.json:
        return json();     
      case EnumTypeAssets.none:
        return none();     

    }
  }
  
  /// Pattern matching
  T maybeMap<T>({
    required T Function() orElse,
    T Function()? pdf,
    T Function()? svg,
    T Function()? png,
    T Function()? ttf,
    T Function()? json,
    T Function()? none,

  }) =>
      map<T>(
      pdf: pdf ?? orElse,     
      svg: svg ?? orElse,     
      png: png ?? orElse,     
      ttf: ttf ?? orElse,     
      json: json ?? orElse,     
      none: none ?? orElse,     

      );

  /// Pattern matching
  T? maybeMapOrNull<T>({
    T Function()? pdf,
    T Function()? svg,
    T Function()? png,
    T Function()? ttf,
    T Function()? json,
    T Function()? none,

  }) =>
      maybeMap<T?>(
        orElse: () => null,
        pdf: pdf,  
        svg: svg,  
        png: png,  
        ttf: ttf,  
        json: json,  
        none: none,  
        
      );

  @override
  int compareTo(EnumTypeAssets other) => index.compareTo(other.index);

  @override
  String toString() => value;
   }
