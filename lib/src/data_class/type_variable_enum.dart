// ignore_for_file: constant_identifier_names, non_constant_identifier_names, lines_longer_than_80_chars
/*
  
  enum TypeVarable {
  enum_('enum'),

  string_(String),
  bool_(bool),
  int_(int),
  double_(double),
  num_(num),
  list_(List),
  list_bool_(List<bool>),
  list_other(List<Object>),
  list_int_(List<int>),
  list_string_(List<String>),
  list_double_(List<double>),

  list_bool_null(List<bool?>),
  list_int_null(List<int?>),
  list_string_null(List<String?>),
  list_double_null(List<double?>),

  list_dynamic_(List<dynamic>),

  list_map_int_string_(List<Map<int, String>>),
  list_map_int_string_null(List<Map<int, String?>>),
  list_map_int_dynamic_(List<Map<int, dynamic>>),

  set_(Set),
  set_string(Set<String>),
  set_string_null(Set<String?>),
  set_int(Set<int>),
  set_int_null(Set<int?>),
  set_bool(Set<bool>),
  set_bool_null(Set<bool?>),
  set_double(Set<double>),
  set_double_null(Set<double?>),
  map_(Map),
  map_string_dynamic_(Map<String, dynamic>),
  map_string_bool(Map<String, bool>),
  map_string_int(Map<String, int>),
  map_string_string(Map<String, String>),
  map_string_double_(Map<String, double>),

  map_string_bool_null(Map<String, bool?>),
  map_string_int_null(Map<String, int?>),
  map_string_string_null(Map<String, String?>),
  map_string_double_null(Map<String, double?>),

  map_int_string(Map<int, String>),
  map_int_string_null(Map<int, String?>),
  map_int_double(Map<int, double>),
  map_int_double_null(Map<int, double?>),
  map_int_bool(Map<int, bool>),
  map_int_bool_null(Map<int, bool?>),
  map_int_dynamic_(Map<int, dynamic>),
  date_time(DateTime),
  map_dynamic_dynamic_(Map<dynamic, dynamic>),
  data('data'),

  list_data(List<data>),
  none_('none');

  const TypeVarable(this.value);

  final String value;
}
  */



enum TypeVarable with Comparable<TypeVarable> {
  enum_('enum'),
  string_('String'),
  bool_('bool'),
  int_('int'),
  double_('double'),
  num_('num'),
  list_('List'),
  list_bool_('List<bool>'),
  list_other('List<Object>'),
  list_int_('List<int>'),
  list_string_('List<String>'),
  list_double_('List<double>'),
  list_bool_null('List<bool?>'),
  list_int_null('List<int?>'),
  list_string_null('List<String?>'),
  list_double_null('List<double?>'),
  list_dynamic_('List<dynamic>'),
  list_map_int_string_('List<Map<int, String>>'),
  list_map_int_string_null('List<Map<int, String?>>'),
  list_map_int_dynamic_('List<Map<int, dynamic>>'),
  set_('Set'),
  set_string('Set<String>'),
  set_string_null('Set<String?>'),
  set_int('Set<int>'),
  set_int_null('Set<int?>'),
  set_bool('Set<bool>'),
  set_bool_null('Set<bool?>'),
  set_double('Set<double>'),
  set_double_null('Set<double?>'),
  map_('Map'),
  map_string_dynamic_('Map<String, dynamic>'),
  map_string_bool('Map<String, bool>'),
  map_string_int('Map<String, int>'),
  map_string_string('Map<String, String>'),
  map_string_double_('Map<String, double>'),
  map_string_bool_null('Map<String, bool?>'),
  map_string_int_null('Map<String, int?>'),
  map_string_string_null('Map<String, String?>'),
  map_string_double_null('Map<String, double?>'),
  map_int_string('Map<int, String>'),
  map_int_string_null('Map<int, String?>'),
  map_int_double('Map<int, double>'),
  map_int_double_null('Map<int, double?>'),
  map_int_bool('Map<int, bool>'),
  map_int_bool_null('Map<int, bool?>'),
  map_int_dynamic_('Map<int, dynamic>'),
  date_time('DateTime'),
  map_dynamic_dynamic_('Map<dynamic, dynamic>'),
  data('data'),
  list_data('List<data>'),
  none_('none');

  const TypeVarable(this.value);

  final String value;

  static TypeVarable fromValue(
    String? value, {
    TypeVarable? fallback,
  }) {
    switch (value) {
      case 'enum':
        return enum_;
      case 'String':
        return string_;
      case 'bool':
        return bool_;
      case 'int':
        return int_;
      case 'double':
        return double_;
      case 'num':
        return num_;
      case 'List':
        return list_;
      case 'List<bool>':
        return list_bool_;
      case 'List<Object>':
        return list_other;
      case 'List<int>':
        return list_int_;
      case 'List<String>':
        return list_string_;
      case 'List<double>':
        return list_double_;
      case 'List<bool?>':
        return list_bool_null;
      case 'List<int?>':
        return list_int_null;
      case 'List<String?>':
        return list_string_null;
      case 'List<double?>':
        return list_double_null;
      case 'List<dynamic>':
        return list_dynamic_;
      case 'List<Map<int, String>>':
        return list_map_int_string_;
      case 'List<Map<int, String?>>':
        return list_map_int_string_null;
      case 'List<Map<int, dynamic>>':
        return list_map_int_dynamic_;
      case 'Set':
        return set_;
      case 'Set<String>':
        return set_string;
      case 'Set<String?>':
        return set_string_null;
      case 'Set<int>':
        return set_int;
      case 'Set<int?>':
        return set_int_null;
      case 'Set<bool>':
        return set_bool;
      case 'Set<bool?>':
        return set_bool_null;
      case 'Set<double>':
        return set_double;
      case 'Set<double?>':
        return set_double_null;
      case 'Map':
        return map_;
      case 'Map<String, dynamic>':
        return map_string_dynamic_;
      case 'Map<String, bool>':
        return map_string_bool;
      case 'Map<String, int>':
        return map_string_int;
      case 'Map<String, String>':
        return map_string_string;
      case 'Map<String, double>':
        return map_string_double_;
      case 'Map<String, bool?>':
        return map_string_bool_null;
      case 'Map<String, int?>':
        return map_string_int_null;
      case 'Map<String, String?>':
        return map_string_string_null;
      case 'Map<String, double?>':
        return map_string_double_null;
      case 'Map<int, String>':
        return map_int_string;
      case 'Map<int, String?>':
        return map_int_string_null;
      case 'Map<int, double>':
        return map_int_double;
      case 'Map<int, double?>':
        return map_int_double_null;
      case 'Map<int, bool>':
        return map_int_bool;
      case 'Map<int, bool?>':
        return map_int_bool_null;
      case 'Map<int, dynamic>':
        return map_int_dynamic_;
      case 'DateTime':
        return date_time;
      case 'Map<dynamic, dynamic>':
        return map_dynamic_dynamic_;
      case 'data':
        return data;
      case 'List<data>':
        return list_data;
      case 'none':
        return none_;

      default:
        return fallback ?? (throw ArgumentError.value(value));
    }
  }

  /// Pattern matching
  T map<T>({
    required T Function() enum_,
    required T Function() string_,
    required T Function() bool_,
    required T Function() int_,
    required T Function() double_,
    required T Function() num_,
    required T Function() list_,
    required T Function() list_bool_,
    required T Function() list_other,
    required T Function() list_int_,
    required T Function() list_string_,
    required T Function() list_double_,
    required T Function() list_bool_null,
    required T Function() list_int_null,
    required T Function() list_string_null,
    required T Function() list_double_null,
    required T Function() list_dynamic_,
    required T Function() list_map_int_string_,
    required T Function() list_map_int_string_null,
    required T Function() list_map_int_dynamic_,
    required T Function() set_,
    required T Function() set_string,
    required T Function() set_string_null,
    required T Function() set_int,
    required T Function() set_int_null,
    required T Function() set_bool,
    required T Function() set_bool_null,
    required T Function() set_double,
    required T Function() set_double_null,
    required T Function() map_,
    required T Function() map_string_dynamic_,
    required T Function() map_string_bool,
    required T Function() map_string_int,
    required T Function() map_string_string,
    required T Function() map_string_double_,
    required T Function() map_string_bool_null,
    required T Function() map_string_int_null,
    required T Function() map_string_string_null,
    required T Function() map_string_double_null,
    required T Function() map_int_string,
    required T Function() map_int_string_null,
    required T Function() map_int_double,
    required T Function() map_int_double_null,
    required T Function() map_int_bool,
    required T Function() map_int_bool_null,
    required T Function() map_int_dynamic_,
    required T Function() date_time,
    required T Function() map_dynamic_dynamic_,
    required T Function() data,
    required T Function() list_data,
    required T Function() none_,
  }) {
    switch (this) {
      case TypeVarable.enum_:
        return enum_();
      case TypeVarable.string_:
        return string_();
      case TypeVarable.bool_:
        return bool_();
      case TypeVarable.int_:
        return int_();
      case TypeVarable.double_:
        return double_();
      case TypeVarable.num_:
        return num_();
      case TypeVarable.list_:
        return list_();
      case TypeVarable.list_bool_:
        return list_bool_();
      case TypeVarable.list_other:
        return list_other();
      case TypeVarable.list_int_:
        return list_int_();
      case TypeVarable.list_string_:
        return list_string_();
      case TypeVarable.list_double_:
        return list_double_();
      case TypeVarable.list_bool_null:
        return list_bool_null();
      case TypeVarable.list_int_null:
        return list_int_null();
      case TypeVarable.list_string_null:
        return list_string_null();
      case TypeVarable.list_double_null:
        return list_double_null();
      case TypeVarable.list_dynamic_:
        return list_dynamic_();
      case TypeVarable.list_map_int_string_:
        return list_map_int_string_();
      case TypeVarable.list_map_int_string_null:
        return list_map_int_string_null();
      case TypeVarable.list_map_int_dynamic_:
        return list_map_int_dynamic_();
      case TypeVarable.set_:
        return set_();
      case TypeVarable.set_string:
        return set_string();
      case TypeVarable.set_string_null:
        return set_string_null();
      case TypeVarable.set_int:
        return set_int();
      case TypeVarable.set_int_null:
        return set_int_null();
      case TypeVarable.set_bool:
        return set_bool();
      case TypeVarable.set_bool_null:
        return set_bool_null();
      case TypeVarable.set_double:
        return set_double();
      case TypeVarable.set_double_null:
        return set_double_null();
      case TypeVarable.map_:
        return map_();
      case TypeVarable.map_string_dynamic_:
        return map_string_dynamic_();
      case TypeVarable.map_string_bool:
        return map_string_bool();
      case TypeVarable.map_string_int:
        return map_string_int();
      case TypeVarable.map_string_string:
        return map_string_string();
      case TypeVarable.map_string_double_:
        return map_string_double_();
      case TypeVarable.map_string_bool_null:
        return map_string_bool_null();
      case TypeVarable.map_string_int_null:
        return map_string_int_null();
      case TypeVarable.map_string_string_null:
        return map_string_string_null();
      case TypeVarable.map_string_double_null:
        return map_string_double_null();
      case TypeVarable.map_int_string:
        return map_int_string();
      case TypeVarable.map_int_string_null:
        return map_int_string_null();
      case TypeVarable.map_int_double:
        return map_int_double();
      case TypeVarable.map_int_double_null:
        return map_int_double_null();
      case TypeVarable.map_int_bool:
        return map_int_bool();
      case TypeVarable.map_int_bool_null:
        return map_int_bool_null();
      case TypeVarable.map_int_dynamic_:
        return map_int_dynamic_();
      case TypeVarable.date_time:
        return date_time();
      case TypeVarable.map_dynamic_dynamic_:
        return map_dynamic_dynamic_();
      case TypeVarable.data:
        return data();
      case TypeVarable.list_data:
        return list_data();
      case TypeVarable.none_:
        return none_();
    }
  }

  /// Pattern matching
  T maybeMap<T>({
    required T Function() orElse,
    T Function()? enum_,
    T Function()? string_,
    T Function()? bool_,
    T Function()? int_,
    T Function()? double_,
    T Function()? num_,
    T Function()? list_,
    T Function()? list_bool_,
    T Function()? list_other,
    T Function()? list_int_,
    T Function()? list_string_,
    T Function()? list_double_,
    T Function()? list_bool_null,
    T Function()? list_int_null,
    T Function()? list_string_null,
    T Function()? list_double_null,
    T Function()? list_dynamic_,
    T Function()? list_map_int_string_,
    T Function()? list_map_int_string_null,
    T Function()? list_map_int_dynamic_,
    T Function()? set_,
    T Function()? set_string,
    T Function()? set_string_null,
    T Function()? set_int,
    T Function()? set_int_null,
    T Function()? set_bool,
    T Function()? set_bool_null,
    T Function()? set_double,
    T Function()? set_double_null,
    T Function()? map_,
    T Function()? map_string_dynamic_,
    T Function()? map_string_bool,
    T Function()? map_string_int,
    T Function()? map_string_string,
    T Function()? map_string_double_,
    T Function()? map_string_bool_null,
    T Function()? map_string_int_null,
    T Function()? map_string_string_null,
    T Function()? map_string_double_null,
    T Function()? map_int_string,
    T Function()? map_int_string_null,
    T Function()? map_int_double,
    T Function()? map_int_double_null,
    T Function()? map_int_bool,
    T Function()? map_int_bool_null,
    T Function()? map_int_dynamic_,
    T Function()? date_time,
    T Function()? map_dynamic_dynamic_,
    T Function()? data,
    T Function()? list_data,
    T Function()? none_,
  }) =>
      map<T>(
        enum_: enum_ ?? orElse,
        string_: string_ ?? orElse,
        bool_: bool_ ?? orElse,
        int_: int_ ?? orElse,
        double_: double_ ?? orElse,
        num_: num_ ?? orElse,
        list_: list_ ?? orElse,
        list_bool_: list_bool_ ?? orElse,
        list_other: list_other ?? orElse,
        list_int_: list_int_ ?? orElse,
        list_string_: list_string_ ?? orElse,
        list_double_: list_double_ ?? orElse,
        list_bool_null: list_bool_null ?? orElse,
        list_int_null: list_int_null ?? orElse,
        list_string_null: list_string_null ?? orElse,
        list_double_null: list_double_null ?? orElse,
        list_dynamic_: list_dynamic_ ?? orElse,
        list_map_int_string_: list_map_int_string_ ?? orElse,
        list_map_int_string_null: list_map_int_string_null ?? orElse,
        list_map_int_dynamic_: list_map_int_dynamic_ ?? orElse,
        set_: set_ ?? orElse,
        set_string: set_string ?? orElse,
        set_string_null: set_string_null ?? orElse,
        set_int: set_int ?? orElse,
        set_int_null: set_int_null ?? orElse,
        set_bool: set_bool ?? orElse,
        set_bool_null: set_bool_null ?? orElse,
        set_double: set_double ?? orElse,
        set_double_null: set_double_null ?? orElse,
        map_: map_ ?? orElse,
        map_string_dynamic_: map_string_dynamic_ ?? orElse,
        map_string_bool: map_string_bool ?? orElse,
        map_string_int: map_string_int ?? orElse,
        map_string_string: map_string_string ?? orElse,
        map_string_double_: map_string_double_ ?? orElse,
        map_string_bool_null: map_string_bool_null ?? orElse,
        map_string_int_null: map_string_int_null ?? orElse,
        map_string_string_null: map_string_string_null ?? orElse,
        map_string_double_null: map_string_double_null ?? orElse,
        map_int_string: map_int_string ?? orElse,
        map_int_string_null: map_int_string_null ?? orElse,
        map_int_double: map_int_double ?? orElse,
        map_int_double_null: map_int_double_null ?? orElse,
        map_int_bool: map_int_bool ?? orElse,
        map_int_bool_null: map_int_bool_null ?? orElse,
        map_int_dynamic_: map_int_dynamic_ ?? orElse,
        date_time: date_time ?? orElse,
        map_dynamic_dynamic_: map_dynamic_dynamic_ ?? orElse,
        data: data ?? orElse,
        list_data: list_data ?? orElse,
        none_: none_ ?? orElse,
      );

  /// Pattern matching
  T? maybeMapOrNull<T>({
    T Function()? enum_,
    T Function()? string_,
    T Function()? bool_,
    T Function()? int_,
    T Function()? double_,
    T Function()? num_,
    T Function()? list_,
    T Function()? list_bool_,
    T Function()? list_other,
    T Function()? list_int_,
    T Function()? list_string_,
    T Function()? list_double_,
    T Function()? list_bool_null,
    T Function()? list_int_null,
    T Function()? list_string_null,
    T Function()? list_double_null,
    T Function()? list_dynamic_,
    T Function()? list_map_int_string_,
    T Function()? list_map_int_string_null,
    T Function()? list_map_int_dynamic_,
    T Function()? set_,
    T Function()? set_string,
    T Function()? set_string_null,
    T Function()? set_int,
    T Function()? set_int_null,
    T Function()? set_bool,
    T Function()? set_bool_null,
    T Function()? set_double,
    T Function()? set_double_null,
    T Function()? map_,
    T Function()? map_string_dynamic_,
    T Function()? map_string_bool,
    T Function()? map_string_int,
    T Function()? map_string_string,
    T Function()? map_string_double_,
    T Function()? map_string_bool_null,
    T Function()? map_string_int_null,
    T Function()? map_string_string_null,
    T Function()? map_string_double_null,
    T Function()? map_int_string,
    T Function()? map_int_string_null,
    T Function()? map_int_double,
    T Function()? map_int_double_null,
    T Function()? map_int_bool,
    T Function()? map_int_bool_null,
    T Function()? map_int_dynamic_,
    T Function()? date_time,
    T Function()? map_dynamic_dynamic_,
    T Function()? data,
    T Function()? list_data,
    T Function()? none_,
  }) =>
      maybeMap<T?>(
        orElse: () => null,
        enum_: enum_,
        string_: string_,
        bool_: bool_,
        int_: int_,
        double_: double_,
        num_: num_,
        list_: list_,
        list_bool_: list_bool_,
        list_other: list_other,
        list_int_: list_int_,
        list_string_: list_string_,
        list_double_: list_double_,
        list_bool_null: list_bool_null,
        list_int_null: list_int_null,
        list_string_null: list_string_null,
        list_double_null: list_double_null,
        list_dynamic_: list_dynamic_,
        list_map_int_string_: list_map_int_string_,
        list_map_int_string_null: list_map_int_string_null,
        list_map_int_dynamic_: list_map_int_dynamic_,
        set_: set_,
        set_string: set_string,
        set_string_null: set_string_null,
        set_int: set_int,
        set_int_null: set_int_null,
        set_bool: set_bool,
        set_bool_null: set_bool_null,
        set_double: set_double,
        set_double_null: set_double_null,
        map_: map_,
        map_string_dynamic_: map_string_dynamic_,
        map_string_bool: map_string_bool,
        map_string_int: map_string_int,
        map_string_string: map_string_string,
        map_string_double_: map_string_double_,
        map_string_bool_null: map_string_bool_null,
        map_string_int_null: map_string_int_null,
        map_string_string_null: map_string_string_null,
        map_string_double_null: map_string_double_null,
        map_int_string: map_int_string,
        map_int_string_null: map_int_string_null,
        map_int_double: map_int_double,
        map_int_double_null: map_int_double_null,
        map_int_bool: map_int_bool,
        map_int_bool_null: map_int_bool_null,
        map_int_dynamic_: map_int_dynamic_,
        date_time: date_time,
        map_dynamic_dynamic_: map_dynamic_dynamic_,
        data: data,
        list_data: list_data,
        none_: none_,
      );

  @override
  int compareTo(TypeVarable other) => index.compareTo(other.index);

  @override
  String toString() => value;
}
