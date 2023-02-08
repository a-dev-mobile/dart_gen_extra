part of 'run_data_class.dart';

String _getEquals(Varable v, bool isLast) {
  final type = v.type;
  final name = v.name;
  final end = isLast ? ');\n' : '&& \n';
  switch (type) {
    case TypeVarable.list_:
    case TypeVarable.list_bool_:
    case TypeVarable.list_bool_null:
    case TypeVarable.list_double_:
    case TypeVarable.list_double_null:
    case TypeVarable.list_dynamic_:
    case TypeVarable.list_int_:
    case TypeVarable.list_int_null:
    case TypeVarable.list_map_int_dynamic_:
    case TypeVarable.list_map_int_string_:
    case TypeVarable.list_map_int_string_null:
    case TypeVarable.list_string_:
    case TypeVarable.list_string_null:

    case TypeVarable.map_:
    case TypeVarable.map_dynamic_dynamic_:
    case TypeVarable.map_int_bool:
    case TypeVarable.map_int_bool_null:
    case TypeVarable.map_int_double:
    case TypeVarable.map_int_double_null:
    case TypeVarable.map_int_dynamic_:
    case TypeVarable.map_int_string:
    case TypeVarable.map_int_string_null:
    case TypeVarable.map_string_bool:
    case TypeVarable.map_string_bool_null:
    case TypeVarable.map_string_double_:
    case TypeVarable.map_string_double_null:
    case TypeVarable.map_string_dynamic_:
    case TypeVarable.map_string_int:
    case TypeVarable.map_string_string:
    case TypeVarable.map_string_int_null:
    case TypeVarable.map_string_string_null:

    case TypeVarable.set_:
    case TypeVarable.set_string:
    case TypeVarable.set_string_null:
    case TypeVarable.set_int:
    case TypeVarable.set_int_null:
    case TypeVarable.set_bool:
    case TypeVarable.set_bool_null:
    case TypeVarable.set_double:
    case TypeVarable.set_double_null:
    case TypeVarable.list_data:
      return '            const DeepCollectionEquality().equals(other.$name, $name)$end';
    case TypeVarable.bool_:
    case TypeVarable.double_:
    case TypeVarable.enum_:
    case TypeVarable.int_:
    case TypeVarable.num_:
    case TypeVarable.string_:
    case TypeVarable.none_:
    case TypeVarable.date_time:
    case TypeVarable.data:
      return '            (identical(other.$name, $name) || other.$name == $name)$end';
    case TypeVarable.list_other:
      return 'error _getEquals';
  }
}
