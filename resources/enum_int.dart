  // ignore_for_file:no-magic-number, constant_identifier_names, non_constant_identifier_names, lines_longer_than_80_chars
  /*
  enum Speed {
  slow(5),
  normal(10),
  fast(25),
  stop(0),
}

  */
  
//          --DartGenExtra--
//  *************************************
// GENERATED CODE BELOW - DO NOT MODIFY
//  *************************************
  

enum Speed with Comparable<Speed> { 
  slow(5),
  normal(10),
  fast(25),
  stop(0);

  const Speed(this.value);

  final int value;

  static Speed fromValue(
    int? value, {
    Speed? fallback,
  }) {
    switch (value) {
      case 5:
        return slow;
      case 10:
        return normal;
      case 25:
        return fast;
      case 0:
        return stop;

      default:
        return fallback ?? (throw ArgumentError.value(value));
    }
  }

  /// Pattern matching
  T map<T>({
    required T Function() slow,
    required T Function() normal,
    required T Function() fast,
    required T Function() stop,

  }) {
    switch (this) {
      case Speed.slow:
        return slow();     
      case Speed.normal:
        return normal();     
      case Speed.fast:
        return fast();     
      case Speed.stop:
        return stop();     

    }
  }
  
  /// Pattern matching
  T maybeMap<T>({
    required T Function() orElse,
    T Function()? slow,
    T Function()? normal,
    T Function()? fast,
    T Function()? stop,

  }) =>
      map<T>(
      slow: slow ?? orElse,     
      normal: normal ?? orElse,     
      fast: fast ?? orElse,     
      stop: stop ?? orElse,     

      );

  /// Pattern matching
  T? maybeMapOrNull<T>({
    T Function()? slow,
    T Function()? normal,
    T Function()? fast,
    T Function()? stop,

  }) =>
      maybeMap<T?>(
        orElse: () => null,
        slow: slow,  
        normal: normal,  
        fast: fast,  
        stop: stop,  
        
      );

  @override
  int compareTo(Speed other) => index.compareTo(other.index);

  @override
  String toString() => value.toString();
   }
