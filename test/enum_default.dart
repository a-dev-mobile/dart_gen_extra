  // ignore_for_file: constant_identifier_names, non_constant_identifier_names, lines_longer_than_80_chars
  /*
  
    enum LocaleEnum { ru, en }
 
  */
  
  //  ******************************
  // GENERATED CODE BELOW - DO NOT MODIFY
  //  ******************************

enum LocaleEnum with Comparable<LocaleEnum> { 
  ru('ru'),
  en('en');

  const LocaleEnum(this.value);

  final String value;

  static LocaleEnum fromValue(
    String? value, {
    LocaleEnum? fallback,
  }) {
    switch (value) {
      case 'ru':
        return ru;
      case 'en':
        return en;

      default:
        return fallback ?? (throw ArgumentError.value(value));
    }
  }

  /// Pattern matching
  T map<T>({
    required T Function() ru,
    required T Function() en,

  }) {
    switch (this) {
      case LocaleEnum.ru:
        return ru();     
      case LocaleEnum.en:
        return en();     

    }
  }
  
  /// Pattern matching
  T maybeMap<T>({
    required T Function() orElse,
    T Function()? ru,
    T Function()? en,

  }) =>
      map<T>(
      ru: ru ?? orElse,     
      en: en ?? orElse,     

      );

  /// Pattern matching
  T? maybeMapOrNull<T>({
    T Function()? ru,
    T Function()? en,

  }) =>
      maybeMap<T?>(
        orElse: () => null,
        ru: ru,  
        en: en,  
        
      );

  @override
  int compareTo(LocaleEnum other) => index.compareTo(other.index);

  @override
  String toString() => value;
   }
