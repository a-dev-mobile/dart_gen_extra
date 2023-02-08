// ignore_for_file: non_constant_identifier_names

part of 'run_data_class.dart';

String getFromMap(Varable v) {
  final type = v.type;
  final name = v.name;
  String nameObject = v.nameObject;

  final fromMap = v.fromMap;
  final isCanNull = v.isCanNull;
  final initComment = v.initValueComment;
  final initDefault_ = v.initValueDefault;
  final error = 'error';

  if (fromMap.isNotEmpty) return fromMap;
  final yes_null_default_yes = isCanNull && initComment.isNotEmpty;
  final yes_null_default_no = isCanNull && initComment.isEmpty;
  final no_null_default_yes = !isCanNull && initComment.isNotEmpty;
  final no_null_default_no = !isCanNull && initComment.isEmpty;

  if (type == TypeVarable.list_data) {
    nameObject = nameObject.replaceAll('List<', '').replaceAll('>', '');
  }

  switch (type) {
// конструктор у set double not const

    case TypeVarable.bool_:
      if (yes_null_default_yes) {
        return '''map['$name'] as bool? ?? $initComment''';
      } else if (yes_null_default_no) {
        return '''map['$name'] as bool?''';
      } else if (no_null_default_yes) {
        return '''map['$name'] as bool? ?? $initComment''';
      } else if (no_null_default_no) {
        return '''map['$name'] as bool''';
      }
      return error;

    case TypeVarable.double_:
      if (yes_null_default_yes) {
        return '''(map['$name'] as num?)?.toDouble() ?? $initComment''';
      } else if (yes_null_default_no) {
        return '''(map['$name'] as num?)?.toDouble()''';
      } else if (no_null_default_yes) {
        return '''(map['$name'] as num?)?.toDouble() ?? $initComment''';
      } else if (no_null_default_no) {
        return '''(map['$name'] as num).toDouble()''';
      }
      return error;

    case TypeVarable.enum_:
      if (isCanNull) {
        return initComment.isEmpty
            ? "map['$name'] != null ? $nameObject.values[map['$name'] as int] : null"
            : "map['$name'] != null ? $nameObject.values[map['$name'] as int] : $initComment";
      } else {
        return "$nameObject.values[map['$name'] as int]";
      }

    case TypeVarable.int_:
      String base = '''map['$name'] as int''';
      if (isCanNull && initComment.isEmpty) return '$base?';

      if (initComment.isNotEmpty) return '$base? ?? $initComment';

      return base;

    case TypeVarable.num_:
      if (yes_null_default_yes) {
        return '''map['$name'] as num? ?? $initComment''';
      } else if (yes_null_default_no) {
        return '''map['$name'] as num?''';
      } else if (no_null_default_yes) {
        return '''map['$name'] as num? ?? $initComment''';
      } else if (no_null_default_no) {
        return '''map['$name'] as num''';
      }
      return error;

    case TypeVarable.string_:
      if (yes_null_default_yes) {
        return "map['$name'] as String? ?? $initComment ";
      } else if (yes_null_default_no) {
        return "map['$name'] as String?";
      } else if (no_null_default_yes) {
        return "map['$name'] as String? ?? $initComment ";
      } else if (no_null_default_no) {
        return "map['$name'] as String";
      }

      return error;

    case TypeVarable.set_:
      if (yes_null_default_yes) {
        return "(map['$name'] as List<dynamic>?)?.toSet() ?? $initComment";
      } else if (yes_null_default_no) {
        return "(map['$name'] as List<dynamic>?)?.toSet()";
      } else if (no_null_default_yes) {
        return "(map['$name'] as List<dynamic>?)?.map((e) => e as String).toSet() ?? $initComment";
      } else if (no_null_default_no) {
        return "(map['$name'] as List<dynamic>).toSet()";
      }

      return error;

    case TypeVarable.set_string:
      if (yes_null_default_yes) {
        return "(map['$name'] as List<dynamic>?)?.map((e) => e as String).toSet() ?? $initComment";
      } else if (yes_null_default_no) {
        return "(map['$name'] as List<dynamic>?)?.map((e) => e as String).toSet()";
      } else if (no_null_default_yes) {
        return "(map['$name'] as List<dynamic>?)?.map((e) => e as String).toSet() ?? $initComment";
      } else if (no_null_default_no) {
        return "(map['$name'] as List<dynamic>).map((e) => e as String).toSet()";
      }

      return error;

    case TypeVarable.set_string_null:
      if (yes_null_default_yes) {
        return "(map['$name'] as List<dynamic>?)?.map((e) => e as String?).toSet() ?? $initComment";
      } else if (yes_null_default_no) {
        return "(map['$name'] as List<dynamic>?)?.map((e) => e as String?).toSet()";
      } else if (no_null_default_yes) {
        return "(map['$name'] as List<dynamic>?)?.map((e) => e as String?).toSet() ?? $initComment";
      } else if (no_null_default_no) {
        return "(map['$name'] as List<dynamic>).map((e) => e as String?).toSet()";
      }

      return error;

    case TypeVarable.set_int:
      if (yes_null_default_yes) {
        return "(map['$name'] as List<dynamic>?)?.map((e) => e as int).toSet() ?? $initComment";
      } else if (yes_null_default_no) {
        return "(map['$name'] as List<dynamic>?)?.map((e) => e as int).toSet()";
      } else if (no_null_default_yes) {
        return "(map['$name'] as List<dynamic>?)?.map((e) => e as int).toSet() ?? $initComment";
      } else if (no_null_default_no) {
        return "(map['$name'] as List<dynamic>).map((e) => e as int).toSet()";
      }

      return error;

    case TypeVarable.set_int_null:
      if (yes_null_default_yes) {
        return "(map['$name'] as List<dynamic>?)?.map((e) => e as int?).toSet() ?? $initComment";
      } else if (yes_null_default_no) {
        return "(map['$name'] as List<dynamic>?)?.map((e) => e as int?).toSet()";
      } else if (no_null_default_yes) {
        return "(map['$name'] as List<dynamic>?)?.map((e) => e as int?).toSet() ?? $initComment";
      } else if (no_null_default_no) {
        return "(map['$name'] as List<dynamic>).map((e) => e as int?).toSet()";
      }

      return error;

    case TypeVarable.set_bool:
      if (yes_null_default_yes) {
        return "(map['$name'] as List<dynamic>?)?.map((e) => e as bool).toSet() ?? $initComment";
      } else if (yes_null_default_no) {
        return "(map['$name'] as List<dynamic>?)?.map((e) => e as bool).toSet()";
      } else if (no_null_default_yes) {
        return "(map['$name'] as List<dynamic>?)?.map((e) => e as bool).toSet() ?? $initComment";
      } else if (no_null_default_no) {
        return "(map['$name'] as List<dynamic>).map((e) => e as bool).toSet()";
      }

      return error;

    case TypeVarable.set_bool_null:
      if (yes_null_default_yes) {
        return "(map['$name'] as List<dynamic>?)?.map((e) => e as bool?).toSet() ?? $initComment";
      } else if (yes_null_default_no) {
        return "(map['$name'] as List<dynamic>?)?.map((e) => e as bool?).toSet()";
      } else if (no_null_default_yes) {
        return "(map['$name'] as List<dynamic>?)?.map((e) => e as bool?).toSet() ?? $initComment";
      } else if (no_null_default_no) {
        return "(map['$name'] as List<dynamic>).map((e) => e as bool?).toSet()";
      }
      return error;

    case TypeVarable.set_double:
      if (yes_null_default_yes) {
        return "(map['$name'] as List<dynamic>?)?.map((e) => (e as num).toDouble()).toSet() ?? $initComment";
      } else if (yes_null_default_no) {
        return "(map['$name'] as List<dynamic>?)?.map((e) => (e as num).toDouble()).toSet()";
      } else if (no_null_default_yes) {
        return "(map['$name'] as List<dynamic>?)?.map((e) => (e as num).toDouble()).toSet() ?? $initComment";
      } else if (no_null_default_no) {
        return "(map['$name'] as List<dynamic>).map((e) => (e as num).toDouble()).toSet()";
      }
      return error;

    case TypeVarable.set_double_null:
      if (yes_null_default_yes) {
        return "(map['$name'] as List<dynamic>?)?.map((e) => (e as num?)?.toDouble()).toSet() ?? $initComment";
      } else if (yes_null_default_no) {
        return "(map['$name'] as List<dynamic>?)?.map((e) => (e as num?)?.toDouble()).toSet()";
      } else if (no_null_default_yes) {
        return "(map['$name'] as List<dynamic>?)?.map((e) => (e as num?)?.toDouble()).toSet() ?? $initComment";
      } else if (no_null_default_no) {
        return "(map['$name'] as List<dynamic>).map((e) => (e as num?)?.toDouble()).toSet()";
      }
      return error;
    case TypeVarable.list_bool_:
      if (yes_null_default_yes) {
        return "(map['$name'] as List<dynamic>?)?.map((e) => e as bool).toList() ?? $initComment";
      } else if (yes_null_default_no) {
        return "(map['$name'] as List<dynamic>?)?.map((e) => e as bool).toList()";
      } else if (no_null_default_yes) {
        return "(map['$name'] as List<dynamic>?)?.map((e) => e as bool).toList() ?? $initComment";
      } else if (no_null_default_no) {
        return "(map['$name'] as List<dynamic>).map((e) => e as bool).toList()";
      }
      return error;
    case TypeVarable.list_bool_null:
      if (yes_null_default_yes) {
        return "(map['$name'] as List<dynamic>?)?.map((e) => e as bool?).toList() ?? $initComment";
      } else if (yes_null_default_no) {
        return "(map['$name'] as List<dynamic>?)?.map((e) => e as bool?).toList()";
      } else if (no_null_default_yes) {
        return "(map['$name'] as List<dynamic>?)?.map((e) => e as bool?).toList() ?? $initComment";
      } else if (no_null_default_no) {
        return "(map['$name'] as List<dynamic>).map((e) => e as bool?).toList()";
      }
      return error;

    case TypeVarable.list_int_:
      if (yes_null_default_yes) {
        return "(map['$name'] as List<dynamic>?)?.map((e) => e as int).toList() ?? $initComment";
      } else if (yes_null_default_no) {
        return "(map['$name'] as List<dynamic>?)?.map((e) => e as int).toList()";
      } else if (no_null_default_yes) {
        return "(map['$name'] as List<dynamic>?)?.map((e) => e as int).toList() ?? $initComment";
      } else if (no_null_default_no) {
        return "(map['$name'] as List<dynamic>).map((e) => e as int).toList()";
      }
      return error;
    case TypeVarable.list_int_null:
      if (yes_null_default_yes) {
        return "(map['$name'] as List<dynamic>?)?.map((e) => e as int).toList() ?? $initComment";
      } else if (yes_null_default_no) {
        return "(map['$name'] as List<dynamic>?)?.map((e) => e as int?).toList()";
      } else if (no_null_default_yes) {
        return "(map['$name'] as List<dynamic>?)?.map((e) => e as int).toList() ?? $initComment";
      } else if (no_null_default_no) {
        return "(map['$name'] as List<dynamic>).map((e) => e as int).toList()";
      }
      return error;

    case TypeVarable.list_string_:
      if (yes_null_default_yes) {
        return "(map['$name'] as List<dynamic>?)?.map((e) => e as String).toList() ?? $initComment";
      } else if (yes_null_default_no) {
        return "(map['$name'] as List<dynamic>?)?.map((e) => e as String).toList()";
      } else if (no_null_default_yes) {
        return "(map['$name'] as List<dynamic>?)?.map((e) => e as String).toList() ?? $initComment";
      } else if (no_null_default_no) {
        return "(map['$name'] as List<dynamic>).map((e) => e as String).toList()";
      }
      return error;

    case TypeVarable.list_string_null:
      if (yes_null_default_yes) {
        return "(map['$name'] as List<dynamic>?)?.map((e) => e as String?).toList() ?? $initComment";
      } else if (yes_null_default_no) {
        return "(map['$name'] as List<dynamic>?)?.map((e) => e as String?).toList()";
      } else if (no_null_default_yes) {
        return "(map['$name'] as List<dynamic>?)?.map((e) => e as String).toList() ?? $initComment";
      } else if (no_null_default_no) {
        return "(map['$name'] as List<dynamic>).map((e) => e as String).toList()";
      }
      return error;
    //
    case TypeVarable.date_time:
      if (yes_null_default_yes) {
        return "map['$name'] == null ? $initComment : DateTime.parse(map['$name'] as String)";
      } else if (yes_null_default_no) {
        return "map['$name'] == null ? null : DateTime.parse(map['$name'] as String)";
      } else if (no_null_default_yes) {
        return "DateTime.parse(map['$name'] as String)";
      } else if (no_null_default_no) {
        return "DateTime.parse(map['$name'] as String)";
      }
      return error;

    case TypeVarable.list_:
      if (yes_null_default_yes) {
        return "map['$name'] as List<dynamic>? ?? $initComment";
      } else if (yes_null_default_no) {
        return "map['$name'] as List<dynamic>?";
      } else if (no_null_default_yes) {
        return "map['$name'] as List<dynamic>? ?? $initComment";
      } else if (no_null_default_no) {
        return "map['$name'] as List<dynamic>";
      }

      return error;

    case TypeVarable.list_double_:
      if (yes_null_default_yes) {
        return "(map['$name'] as List<dynamic>?)?.map((e) => (e as num).toDouble()).toList() ?? $initComment";
      } else if (yes_null_default_no) {
        return "(map['$name'] as List<dynamic>?)?.map((e) => (e as num).toDouble()).toList()";
      } else if (no_null_default_yes) {
        return "(map['$name'] as List<dynamic>?)?.map((e) => (e as num).toDouble()).toList() ?? $initComment";
      } else if (no_null_default_no) {
        return "(map['$name'] as List<dynamic>).map((e) => (e as num).toDouble()).toList()";
      }

      return error;
    case TypeVarable.list_double_null:
      if (yes_null_default_yes) {
        return "(map['$name'] as List<dynamic>?)?.map((e) => (e as num?)?.toDouble()).toList() ?? $initComment";
      } else if (yes_null_default_no) {
        return "(map['$name'] as List<dynamic>?)?.map((e) => (e as num?)?.toDouble()).toList()";
      } else if (no_null_default_yes) {
        return "(map['$name'] as List<dynamic>?)?.map((e) => (e as num?)?.toDouble()).toList() ?? $initComment";
      } else if (no_null_default_no) {
        return "(map['$name'] as List<dynamic>).map((e) => (e as num?)?.toDouble()).toList()";
      }
      return error;

    case TypeVarable.list_dynamic_:
      if (yes_null_default_yes) {
        return "map['$name'] as List<dynamic>? ?? $initComment";
      } else if (yes_null_default_no) {
        return "map['$name'] as List<dynamic>?";
      } else if (no_null_default_yes) {
        return "map['$name'] as List<dynamic>? ?? $initComment";
      } else if (no_null_default_no) {
        return "map['$name'] as List<dynamic>";
      }
      return error;
    case TypeVarable.list_map_int_dynamic_:
      if (yes_null_default_yes) {
        return "(map['$name'] as List<dynamic>?)?.map((e) => (e as Map<String, dynamic>).map((k, e) => MapEntry(int.parse(k), e))).toList() ?? $initComment";
      } else if (yes_null_default_no) {
        return "(map['$name'] as List<dynamic>?)?.map((e) => (e as Map<String, dynamic>).map((k, e) => MapEntry(int.parse(k), e))).toList()";
      } else if (no_null_default_yes) {
        return "(map['$name'] as List<dynamic>?)?.map((e) => (e as Map<String, dynamic>).map((k, e) => MapEntry(int.parse(k), e))).toList() ?? $initComment";
      } else if (no_null_default_no) {
        return "(map['$name'] as List<dynamic>).map((e) => (e as Map<String, dynamic>).map((k, e) => MapEntry(int.parse(k), e))).toList()";
      }
      return error;
    case TypeVarable.list_map_int_string_:
      if (yes_null_default_yes) {
        return "(map['$name']  as List<dynamic>?)?.map((e) => (e as Map<String, dynamic>).map( (k, e) => MapEntry(int.parse(k), e as String), )) .toList() ?? $initComment";
      } else if (yes_null_default_no) {
        return "(map['$name']  as List<dynamic>?)?.map((e) => (e as Map<String, dynamic>).map( (k, e) => MapEntry(int.parse(k), e as String), )) .toList()";
      } else if (no_null_default_yes) {
        return "(map['$name']  as List<dynamic>?)?.map((e) => (e as Map<String, dynamic>).map( (k, e) => MapEntry(int.parse(k), e as String), )) .toList() ?? $initComment";
      } else if (no_null_default_no) {
        return "(map['$name'] as List<dynamic>).map((e) => (e as Map<String, dynamic>).map((k, e) => MapEntry(int.parse(k), e as String))).toList()";
      }

      return error;
    case TypeVarable.list_map_int_string_null:
      if (yes_null_default_yes) {
        return "(map['$name'] as List<dynamic>?)?.map((e) => (e as Map<String, dynamic>).map((k, e) => MapEntry(int.parse(k), e as String), )).toList() ?? $initComment";
      } else if (yes_null_default_no) {
        return "(map['$name'] as List<dynamic>?)?.map((e) => (e as Map<String, dynamic>).map((k, e) => MapEntry(int.parse(k), e as String), )).toList()";
      } else if (no_null_default_yes) {
        return "(map['$name'] as List<dynamic>?)?.map((e) => (e as Map<String, dynamic>).map((k, e) => MapEntry(int.parse(k), e as String), )).toList() ?? $initComment";
      } else if (no_null_default_no) {
        return "(map['$name'] as List<dynamic>) .map((e) => (e as Map<String, dynamic>).map((k, e) => MapEntry(int.parse(k), e as String))).toList()";
      }

      return '';

    // MAP ******************************
    case TypeVarable.map_int_dynamic_:
      if (yes_null_default_yes) {
        return " (map['$name'] as Map<String, dynamic>?)?.map((k, e) => MapEntry(int.parse(k), e)) ?? $initComment";
      } else if (yes_null_default_no) {
        return " (map['$name'] as Map<String, dynamic>?)?.map((k, e) => MapEntry(int.parse(k), e))";
      } else if (no_null_default_yes) {
        return " (map['$name'] as Map<String, dynamic>?)?.map((k, e) => MapEntry(int.parse(k), e)) ?? $initComment";
      } else if (no_null_default_no) {
        return "(map['$name'] as Map<String, dynamic>).map( (k, e) => MapEntry(int.parse(k), e))";
      }
      return error;

    case TypeVarable.map_int_double:
      if (yes_null_default_yes) {
        return "(map['$name'] as Map<String, dynamic>?)?.map((k, e) => MapEntry(int.parse(k), (e as num).toDouble())) ?? $initComment";
      } else if (yes_null_default_no) {
        return "(map['$name'] as Map<String, dynamic>?)?.map((k, e) => MapEntry(int.parse(k), (e as num).toDouble()))";
      } else if (no_null_default_yes) {
        return "(map['$name'] as Map<String, dynamic>?)?.map((k, e) => MapEntry(int.parse(k), (e as num).toDouble())) ?? $initComment";
      } else if (no_null_default_no) {
        return "(map['$name'] as Map<String, dynamic>).map((k, e) => MapEntry(int.parse(k), (e as num).toDouble()))";
      }
      return error;

    case TypeVarable.map_int_double_null:
      if (yes_null_default_yes) {
        return "(map['$name'] as Map<String, dynamic>?)?.map((k, e) => MapEntry(int.parse(k), (e as num?)?.toDouble())) ?? $initComment";
      } else if (yes_null_default_no) {
        return "(map['$name'] as Map<String, dynamic>?)?.map((k, e) => MapEntry(int.parse(k), (e as num?)?.toDouble()))";
      } else if (no_null_default_yes) {
        return "(map['$name'] as Map<String, dynamic>?)?.map((k, e) => MapEntry(int.parse(k), (e as num?)?.toDouble())) ?? $initComment";
      } else if (no_null_default_no) {
        return "(map['$name'] as Map<String, dynamic>).map((k, e) => MapEntry(int.parse(k), (e as num?)?.toDouble()))";
      }
      return error;

    case TypeVarable.map_string_bool:
      if (yes_null_default_yes) {
        return "(map['$name'] as Map<String, dynamic>?)?.map((k, e) => MapEntry(k, e as bool)) ?? $initComment";
      } else if (yes_null_default_no) {
        return "(map['$name'] as Map<String, dynamic>?)?.map((k, e) => MapEntry(k, e as bool))";
      } else if (no_null_default_yes) {
        return "(map['$name'] as Map<String, dynamic>?)?.map((k, e) => MapEntry(k, e as bool)) ?? $initComment";
      } else if (no_null_default_no) {
        return "Map<String, bool>.from(map['$name'] as Map)";
      }
      return error;
    case TypeVarable.map_string_bool_null:
      if (yes_null_default_yes) {
        return "(map['$name'] as Map<String, dynamic>?)?.map((k, e) => MapEntry(k, e as bool?)) ?? $initComment";
      } else if (yes_null_default_no) {
        return "(map['$name'] as Map<String, dynamic>?)?.map((k, e) => MapEntry(k, e as bool?))";
      } else if (no_null_default_yes) {
        return "(map['$name'] as Map<String, dynamic>?)?.map((k, e) => MapEntry(k, e as bool?)) ?? $initComment";
      } else if (no_null_default_no) {
        return "Map<String, bool>.from(map['$name'] as Map)";
      }
      return error;

    case TypeVarable.map_:
      if (yes_null_default_yes) {
        return "map['$name'] as Map<String, dynamic>? ?? $initComment";
      } else if (yes_null_default_no) {
        return "map['$name'] as Map<String, dynamic>?";
      } else if (no_null_default_yes) {
        return "map['$name'] as Map<String, dynamic>? ?? $initComment";
      } else if (no_null_default_no) {
        return "map['$name'] as Map<String, dynamic>";
      }
      return error;
    case TypeVarable.map_dynamic_dynamic_:
      if (yes_null_default_yes) {
        return "map['$name'] as Map<String, dynamic>? ?? $initComment";
      } else if (yes_null_default_no) {
        return "map['$name'] as Map<String, dynamic>?";
      } else if (no_null_default_yes) {
        return "map['$name'] as Map<String, dynamic>? ?? $initComment";
      } else if (no_null_default_no) {
        return "map['$name'] as Map<String, dynamic>";
      }
      return error;
    case TypeVarable.map_string_dynamic_:
      if (yes_null_default_yes) {
        return "map['$name'] as Map<String, dynamic>?";
      } else if (yes_null_default_no) {
        return "map['$name'] as Map<String, dynamic>?";
      } else if (no_null_default_yes) {
        return "map['$name'] as Map<String, dynamic>?";
      } else if (no_null_default_no) {
        return "map['$name'] as Map<String, dynamic>";
      }
      return error;

    case TypeVarable.map_string_string:
      if (yes_null_default_yes) {
        return "(map['$name'] as Map<String, dynamic>?)?.map((k, e) => MapEntry(k, e as String)) ?? $initComment";
      } else if (yes_null_default_no) {
        return "(map['$name'] as Map<String, dynamic>?)?.map((k, e) => MapEntry(k, e as String))";
      } else if (no_null_default_yes) {
        return "(map['$name'] as Map<String, dynamic>?)?.map((k, e) => MapEntry(k, e as String)) ?? $initComment";
      } else if (no_null_default_no) {
        return "Map<String, String>.from(map['$name'] as Map)";
      }
      return error;

    case TypeVarable.map_string_string_null:
      if (yes_null_default_yes) {
        return "(map['$name'] as Map<String, dynamic>?)?.map((k, e) => MapEntry(k, e as String?)) ?? $initComment";
      } else if (yes_null_default_no) {
        return "(map['$name'] as Map<String, dynamic>?)?.map((k, e) => MapEntry(k, e as String?))";
      } else if (no_null_default_yes) {
        return "(map['$name'] as Map<String, dynamic>?)?.map((k, e) => MapEntry(k, e as String?)) ?? $initComment";
      } else if (no_null_default_no) {
        return "Map<String, String>.from(map['$name'] as Map)";
      }
      return error;

    case TypeVarable.map_string_int:
      if (yes_null_default_yes) {
        return "(map['$name'] as Map<String, dynamic>?)?.map( (k, e) => MapEntry(k, e as int)) ?? $initComment";
      } else if (yes_null_default_no) {
        return "(map['$name'] as Map<String, dynamic>?)?.map( (k, e) => MapEntry(k, e as int))";
      } else if (no_null_default_yes) {
        return "(map['$name'] as Map<String, dynamic>?)?.map( (k, e) => MapEntry(k, e as int)) ?? $initComment";
      } else if (no_null_default_no) {
        return " Map<String, int>.from(map['$name'] as Map)";
      }
      return error;
    case TypeVarable.map_string_int_null:
      if (yes_null_default_yes) {
        return "(map['$name'] as Map<String, dynamic>?)?.map( (k, e) => MapEntry(k, e as int?)) ?? $initComment";
      } else if (yes_null_default_no) {
        return "(map['$name'] as Map<String, dynamic>?)?.map( (k, e) => MapEntry(k, e as int?))";
      } else if (no_null_default_yes) {
        return "(map['$name'] as Map<String, dynamic>?)?.map( (k, e) => MapEntry(k, e as int?)) ?? $initComment";
      } else if (no_null_default_no) {
        return "Map<String, int>.from(map['$name'] as Map)";
      }
      return error;

    case TypeVarable.map_string_double_:
      if (yes_null_default_yes) {
        return "(map['$name'] as Map<String, dynamic>?)?.map( (k, e) => MapEntry(k, (e as num).toDouble())) ?? $initComment";
      } else if (yes_null_default_no) {
        return "(map['$name'] as Map<String, dynamic>?)?.map( (k, e) => MapEntry(k, (e as num).toDouble()))";
      } else if (no_null_default_yes) {
        return "(map['$name'] as Map<String, dynamic>?)?.map( (k, e) => MapEntry(k, (e as num).toDouble())) ?? $initComment";
      } else if (no_null_default_no) {
        return "(map['$name'] as Map<String, dynamic>).map((k, e) => MapEntry(k, (e as num).toDouble()))";
      }
      return error;

    case TypeVarable.map_string_double_null:
      if (yes_null_default_yes) {
        return "(map['$name'] as Map<String, dynamic>?)?.map((k, e) => MapEntry(k, (e as num?)?.toDouble())) ?? $initComment";
      } else if (yes_null_default_no) {
        return "(map['$name'] as Map<String, dynamic>?)?.map((k, e) => MapEntry(k, (e as num?)?.toDouble()))";
      } else if (no_null_default_yes) {
        return "(map['$name'] as Map<String, dynamic>?)?.map((k, e) => MapEntry(k, (e as num?)?.toDouble())) ?? $initComment";
      } else if (no_null_default_no) {
        return "(map['$name'] as Map<String, dynamic>).map((k, e) => MapEntry(k, (e as num?)?.toDouble()))";
      }
      return error;

    case TypeVarable.map_int_bool:
      if (yes_null_default_yes) {
        return "(map['$name'] as Map<String, dynamic>?)?.map((k, e) => MapEntry(int.parse(k), e as bool)) ?? $initComment";
      } else if (yes_null_default_no) {
        return "(map['$name'] as Map<String, dynamic>?)?.map((k, e) => MapEntry(int.parse(k), e as bool))";
      } else if (no_null_default_yes) {
        return "(map['$name'] as Map<String, dynamic>?)?.map((k, e) => MapEntry(int.parse(k), e as bool)) ?? $initComment";
      } else if (no_null_default_no) {
        return "(map['$name'] as Map<String, dynamic>).map((k, e) => MapEntry(int.parse(k), e as bool))";
      }
      return error;

    case TypeVarable.map_int_bool_null:
      if (yes_null_default_yes) {
        return "(map['$name'] as Map<String, dynamic>?)?.map((k, e) => MapEntry(int.parse(k), e as bool?)) ?? $initComment";
      } else if (yes_null_default_no) {
        return "(map['$name'] as Map<String, dynamic>?)?.map((k, e) => MapEntry(int.parse(k), e as bool?))";
      } else if (no_null_default_yes) {
        return "(map['$name'] as Map<String, dynamic>?)?.map((k, e) => MapEntry(int.parse(k), e as bool?)) ?? $initComment";
      } else if (no_null_default_no) {
        return "(map['$name'] as Map<String, dynamic>).map((k, e) => MapEntry(int.parse(k), e as bool?))";
      }
      return error;

    case TypeVarable.map_int_string:
      if (yes_null_default_yes) {
        return "(map['$name'] as Map<String, dynamic>?)?.map((k, e) => MapEntry(int.parse(k), e as String)) ?? $initComment";
      } else if (yes_null_default_no) {
        return "(map['$name'] as Map<String, dynamic>?)?.map((k, e) => MapEntry(int.parse(k), e as String))";
      } else if (no_null_default_yes) {
        return "(map['$name'] as Map<String, dynamic>?)?.map((k, e) => MapEntry(int.parse(k), e as String)) ?? $initComment";
      } else if (no_null_default_no) {
        return "(map['$name'] as Map<String, dynamic>).map((k, e) => MapEntry(int.parse(k), e as String))";
      }
      return error;

    case TypeVarable.map_int_string_null:
      if (yes_null_default_yes) {
        return "(map['$name'] as Map<String, dynamic>?)?.map((k, e) => MapEntry(int.parse(k), e as String)) ?? $initComment";
      } else if (yes_null_default_no) {
        return "(map['$name'] as Map<String, dynamic>?)?.map((k, e) => MapEntry(int.parse(k), e as String))";
      } else if (no_null_default_yes) {
        return "(map['$name'] as Map<String, dynamic>?)?.map((k, e) => MapEntry(int.parse(k), e as String)) ?? $initComment";
      } else if (no_null_default_no) {
        return "(map['$name'] as Map<String, dynamic>).map((k, e) => MapEntry(int.parse(k), e as String?))";
      }
      return error;

    case TypeVarable.list_other:
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
    case TypeVarable.data:
      if (yes_null_default_yes) {
        return "map['$name'] != null ? $nameObject.fromMap(map['$name'] as Map<String, dynamic>,) : $initComment";
      } else if (yes_null_default_no) {
        return "map['$name'] != null ? $nameObject.fromMap(map['$name'] as Map<String, dynamic>,) : null";
      } else if (no_null_default_yes) {
        return "$nameObject.fromMap(map['$name'] as Map<String, dynamic>,)";
      } else if (no_null_default_no) {
        return "$nameObject.fromMap(map['$name'] as Map<String, dynamic>,)";
        //   ValidNameFormz.fromMap(map['validNameFormz'] as Map<String, dynamic>),
      }
      return error;
    case TypeVarable.list_data:
      if (yes_null_default_yes) {
        return "map['$name'] != null ? (map['$name'] as List<dynamic>).map((e) => $nameObject.fromMap(e as Map<String, dynamic>)).toList() : $initComment";
      } else if (yes_null_default_no) {
        return "map['$name'] != null ? (map['$name'] as List<dynamic>).map((e) => $nameObject.fromMap(e as Map<String, dynamic>)).toList() : null";
      } else if (no_null_default_yes) {
        return "(map['$name'] as List<dynamic>).map((e) => $nameObject.fromMap(e as Map<String, dynamic>)).toList()";
      } else if (no_null_default_no) {
        return "(map['$name'] as List<dynamic>).map((e) => $nameObject.fromMap(e as Map<String, dynamic>)).toList()";
      }
      return error;
  }
}
