part of 'run_data_class.dart';

// добавляем ли const в factory init
String _getWordConst(Varable v) {
  final type = v.type;
  final init = v.initValueDefault;
  final initComment = v.initValueComment;

  if (init == initComment) return '';

  switch (init) {
    case '[]':
    case '{}':
      return 'const $init';
  }

  return init;
}

String _getDefaultInitValue(TypeVarable type, String init, bool isCanNull) {
  final mapDefault = init.isEmpty ? '{}' : init;
  final listDefault = init.isEmpty ? '[]' : init;
  final isNullAndEmptyInit = isCanNull && init.isEmpty;
  if (isNullAndEmptyInit) return '';
  final dynamic initValue = type.map(
    enum_: () => init,
    string_: () => init.isEmpty ? "''" : init,
    bool_: () => init.toLowerCase() == 'true',
    int_: () {
      final v = int.tryParse(init);
      if (v == null) return 0;
      return init;
    },
    double_: () {
      final v = double.tryParse(init);
      if (v == null) return 0;
      return UtilsNumber.removeTrailingZerosAndNumberfy(v);
    },
    num_: () {
      final v = double.tryParse(init);
      if (v == null) return 0;
      return UtilsNumber.removeTrailingZerosAndNumberfy(v);
    },
    list_string_: () {
      if (init.isEmpty) return [];
      return init.replaceAll('null', '');
    },
    list_int_: () {
      if (init.isEmpty) return [];
      return init.replaceAll('null', '');
    },
    list_int_null: () => listDefault,
    list_string_null: () => listDefault,
    map_int_string: () => mapDefault,
    map_int_string_null: () => mapDefault,
    map_string_bool: () => mapDefault,
    map_string_bool_null: () => mapDefault,
    map_: () => mapDefault,
    map_dynamic_dynamic_: () => mapDefault,
    map_int_bool: () => mapDefault,
    map_int_bool_null: () => mapDefault,
    map_int_double: () => mapDefault,
    map_int_double_null: () => mapDefault,
    map_int_dynamic_: () => mapDefault,
    map_string_double_: () => mapDefault,
    map_string_double_null: () => mapDefault,
    map_string_dynamic_: () => mapDefault,
    map_string_int: () => mapDefault,
    map_string_int_null: () => mapDefault,
    map_string_string: () => mapDefault,
    map_string_string_null: () => mapDefault,
    set_: () => mapDefault,
    set_string: () => mapDefault,
    set_string_null: () => mapDefault,
    set_int: () => mapDefault,
    set_int_null: () => mapDefault,
    set_bool: () => mapDefault,
    set_bool_null: () => mapDefault,
    set_double: () => mapDefault,
    set_double_null: () => mapDefault,
    list_: () => listDefault,
    list_bool_: () => listDefault,
    list_bool_null: () => listDefault,
    list_double_: () => listDefault,
    list_double_null: () => listDefault,
    list_dynamic_: () => listDefault,
    list_map_int_dynamic_: () => listDefault,
    list_map_int_string_: () => listDefault,
    list_map_int_string_null: () => listDefault,
    list_other: () => listDefault,
    none_: () => init,
    date_time: () => 'DateTime.now()',
    data: () => init, list_data: ()=>listDefault,
  );

  // print(initValue.toString());
  return initValue.toString();
}
