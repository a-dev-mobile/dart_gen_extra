  // ignore_for_file: constant_identifier_names, non_constant_identifier_names, lines_longer_than_80_chars
  /*
  
enum Seasons {
  spring,
  summer,
  autumn,
  winter,
}
  */
  
//          --DartGenExtra--
//  *************************************
// GENERATED CODE BELOW - DO NOT MODIFY
//  *************************************
  

enum Seasons with Comparable<Seasons> { 
  spring('spring'),
  summer('summer'),
  autumn('autumn'),
  winter('winter');

  const Seasons(this.value);

  final String value;

  static Seasons fromValue(
    String? value, {
    Seasons? fallback,
  }) {
    switch (value) {
      case 'spring':
        return spring;
      case 'summer':
        return summer;
      case 'autumn':
        return autumn;
      case 'winter':
        return winter;

      default:
        return fallback ?? (throw ArgumentError.value(value));
    }
  }

  /// Pattern matching
  T map<T>({
    required T Function() spring,
    required T Function() summer,
    required T Function() autumn,
    required T Function() winter,

  }) {
    switch (this) {
      case Seasons.spring:
        return spring();     
      case Seasons.summer:
        return summer();     
      case Seasons.autumn:
        return autumn();     
      case Seasons.winter:
        return winter();     

    }
  }
  
  /// Pattern matching
  T maybeMap<T>({
    required T Function() orElse,
    T Function()? spring,
    T Function()? summer,
    T Function()? autumn,
    T Function()? winter,

  }) =>
      map<T>(
      spring: spring ?? orElse,     
      summer: summer ?? orElse,     
      autumn: autumn ?? orElse,     
      winter: winter ?? orElse,     

      );

  /// Pattern matching
  T? maybeMapOrNull<T>({
    T Function()? spring,
    T Function()? summer,
    T Function()? autumn,
    T Function()? winter,

  }) =>
      maybeMap<T?>(
        orElse: () => null,
        spring: spring,  
        summer: summer,  
        autumn: autumn,  
        winter: winter,  
        
      );

  @override
  int compareTo(Seasons other) => index.compareTo(other.index);

  @override
  String toString() => value;
   }
