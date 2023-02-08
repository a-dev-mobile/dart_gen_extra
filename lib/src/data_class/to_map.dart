// ignore_for_file: non_constant_identifier_names

part of 'run_data_class.dart';

String _getToMap(Varable v) {
  final type = v.type;
  final name = v.name;
  final nameEnum = v.nameObject;
  final toMap = v.toMap;
  final isCanNull = v.isCanNull;
  final initComment = v.initValueComment;
  final error = 'error';

  if (toMap.isNotEmpty) return toMap;
  final yes_null_default_yes = isCanNull && initComment.isNotEmpty;
  final yes_null_default_no = isCanNull && initComment.isEmpty;
  final no_null_default_yes = !isCanNull && initComment.isNotEmpty;
  final no_null_default_no = !isCanNull && initComment.isEmpty;

  switch (type) {
    case TypeVarable.string_:

    case TypeVarable.bool_:

    case TypeVarable.int_:

    case TypeVarable.num_:

    case TypeVarable.double_:
      if (yes_null_default_yes) {
        return name;
      } else if (yes_null_default_no) {
        return name;
      } else if (no_null_default_yes) {
        return name;
      } else if (no_null_default_no) {
        return name;
      }
      return error;

    case TypeVarable.none_:
      if (yes_null_default_yes) {
        return error;
      } else if (yes_null_default_no) {
        return error;
      } else if (no_null_default_yes) {
        return error;
      } else if (no_null_default_no) {
        return error;
      }
      return error;

    case TypeVarable.enum_:
      if (yes_null_default_yes) {
        return "$name?.index";
      } else if (yes_null_default_no) {
        return "$name?.index";
      } else if (no_null_default_yes) {
        return "$name.index";
      } else if (no_null_default_no) {
        return "$name.index";
      }
      return error;
// SET
    case TypeVarable.set_double:
    case TypeVarable.set_double_null:
    case TypeVarable.set_:
    case TypeVarable.set_string:
    case TypeVarable.set_string_null:
    case TypeVarable.set_int:
    case TypeVarable.set_int_null:
    case TypeVarable.set_bool:
    case TypeVarable.set_bool_null:
      if (yes_null_default_yes) {
        return "$name?.toList()";
      } else if (yes_null_default_no) {
        return "$name?.toList()";
      } else if (no_null_default_yes) {
        return "$name.toList()";
      } else if (no_null_default_no) {
        return "$name.toList()";
      }
      return error;

    // MAP
    case TypeVarable.map_string_bool:
    case TypeVarable.map_string_bool_null:
    case TypeVarable.map_string_double_:
    case TypeVarable.map_string_double_null:
    case TypeVarable.map_string_dynamic_:
    case TypeVarable.map_string_int:
    case TypeVarable.map_string_string:
    case TypeVarable.map_string_int_null:
    case TypeVarable.map_string_string_null:
      if (yes_null_default_yes) {
        return "$name?.map(MapEntry.new)";
      } else if (yes_null_default_no) {
        return "$name?.map(MapEntry.new)";
      } else if (no_null_default_yes) {
        return "$name.map(MapEntry.new)";
      } else if (no_null_default_no) {
        return "$name.map(MapEntry.new)";
      }
      return error;

    case TypeVarable.map_:
    case TypeVarable.map_dynamic_dynamic_:
    case TypeVarable.map_int_bool:
    case TypeVarable.map_int_bool_null:
    case TypeVarable.map_int_double:
    case TypeVarable.map_int_double_null:
    case TypeVarable.map_int_dynamic_:
    case TypeVarable.map_int_string:
    case TypeVarable.map_int_string_null:
      if (yes_null_default_yes) {
        return "$name?.map((k, e) => MapEntry(k.toString(), e))";
      } else if (yes_null_default_no) {
        return "$name?.map((k, e) => MapEntry(k.toString(), e))";
      } else if (no_null_default_yes) {
        return "$name.map((k, e) => MapEntry(k.toString(), e))";
      } else if (no_null_default_no) {
        return "$name.map((k, e) => MapEntry(k.toString(), e))";
      }
      return error;
    case TypeVarable.list_other:
    case TypeVarable.list_:
    case TypeVarable.list_bool_:
    case TypeVarable.list_bool_null:
    case TypeVarable.list_double_:
    case TypeVarable.list_double_null:
    case TypeVarable.list_dynamic_:
    case TypeVarable.list_int_:
    case TypeVarable.list_int_null:
    case TypeVarable.list_string_:
    case TypeVarable.list_string_null:
      return name;
    case TypeVarable.list_map_int_dynamic_:
      if (yes_null_default_yes) {
        return '''$name?.map((e) => e.map((k, e) => MapEntry(k.toString(), e))).toList()''';
      } else if (yes_null_default_no) {
        return '''$name?.map((e) => e.map((k, e) => MapEntry(k.toString(), e))).toList()''';
      } else if (no_null_default_yes) {
        return '''$name.map((e) => e.map((k, e) => MapEntry(k.toString(), e))).toList()''';
      } else if (no_null_default_no) {
        return '''$name.map((e) => e.map((k, e) => MapEntry(k.toString(), e))).toList()''';
      }

      return error;

    case TypeVarable.list_map_int_string_:
      if (yes_null_default_yes) {
        return '''$name?.map((e) => e.map((k, e) => MapEntry(k.toString(), e))).toList()''';
      } else if (yes_null_default_no) {
        return '''$name?.map((e) => e.map((k, e) => MapEntry(k.toString(), e))).toList()''';
      } else if (no_null_default_yes) {
        return '''$name.map((e) => e.map((k, e) => MapEntry(k.toString(), e))).toList()''';
      } else if (no_null_default_no) {
        return '''$name.map((e) => e.map((k, e) => MapEntry(k.toString(), e))).toList()''';
      }

      return error;

    case TypeVarable.list_map_int_string_null:
      if (yes_null_default_yes) {
        return '''$name?.map((e) => e.map((k, e) => MapEntry(k.toString(), e))).toList()''';
      } else if (yes_null_default_no) {
        return '''$name?.map((e) => e.map((k, e) => MapEntry(k.toString(), e))).toList()''';
      } else if (no_null_default_yes) {
        return "$name.map((e) => e.map((k, e) => MapEntry(k.toString(), e))).toList()";
      } else if (no_null_default_no) {
        return "$name.map((e) => e.map((k, e) => MapEntry(k.toString(), e))).toList()";
      }
      return error;
    case TypeVarable.date_time:
      if (yes_null_default_yes) {
        return "$name?.toIso8601String()";
      } else if (yes_null_default_no) {
        return "$name?.toIso8601String()";
      } else if (no_null_default_yes) {
        return "$name.toIso8601String()";
      } else if (no_null_default_no) {
        return "$name.toIso8601String()";
      }
      return error;
    case TypeVarable.data:
      if (yes_null_default_yes) {
        return "$name?.toMap() ?? $initComment";
      } else if (yes_null_default_no) {
        return "$name?.toMap()";
      } else if (no_null_default_yes) {
        return "$name.toMap()";
      } else if (no_null_default_no) {
        return "$name.toMap()";
      }
      return error;

    case TypeVarable.list_data:
      if (yes_null_default_yes) {
        return "$name?.map((e) => e.toJson()).toList()  ?? $initComment";
      } else if (yes_null_default_no) {
        return "$name?.map((e) => e.toJson()).toList()";
      } else if (no_null_default_yes) {
        return "$name.map((e) => e.toJson()).toList()";
      } else if (no_null_default_no) {
        return "$name.map((e) => e.toJson()).toList()";
      }
      return error;
  }
}
