// ignore_for_file: sort_constructors_first
import 'dart:convert';
import 'package:collection/collection.dart';
import 'package:dart_gen_extra/enum_type_run.dart';

class TypeVarable2 {    
  /* 
  init: EnumTypeRun.data
  type: enum 
   */

  final EnumTypeRun enumTypeRun;
  /*  */
  final Map<String, dynamic> m;
  /*  */
  final Map<dynamic, dynamic> m5;
  /*  */
  final Map m6;

  /*  */
  final num? m3;
  /*  */
  final List m4;
  /*  */
  final int? id;
  /*  */
  final List<Map<int, String>> listId;
  /*  */
  final List<int> i1;
   /*  */
  final List<String> s1;
  /*  */
  final List<dynamic> d2;
  /*  */
  final List<double>? d1;
  /*  */
  final Set<String> s2;

  /*  */
  final List<bool>? listbool;

  /*  */
  final int i4;

  /*  */
  final String s4;

  /*  */
  final String? s5;
// end
   
  //  ******************************
  // GENERATED CODE BELOW - DO NOT MODIFY
  //  ******************************

  
  const TypeVarable2({
    this.enumTypeRun = EnumTypeRun.data,
    required this.m,
    required this.m5,
    required this.m6,
    this.m3,
    required this.m4,
    this.id,
    required this.listId,
    required this.i1,
    required this.s1,
    required this.d2,
    this.d1,
    required this.s2,
    this.listbool,
    required this.i4,
    required this.s4,
    this.s5,
  });
  /*
  
   factory TypeVarable2.init() => TypeVarable2(
        m: const {},
        m5: const {},
        m6: const {},
        m4: const [],
        listId: const [],
        i1: const [],
        s1: const [],
        d2: const [],
        s2: const {},
        i4: 0,
        s4: '',
      ); 
  */

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'enumTypeRun': enumTypeRun.index, 
      'm': m.map(MapEntry.new), 
      'm5': m5.map((k, e) => MapEntry(k.toString(), e)), 
      'm6': m6.map((k, e) => MapEntry(k.toString(), e)), 
      'm3': m3, 
      'm4': m4, 
      'id': id, 
      'listId': listId.map((e) => e.map((k, e) => MapEntry(k.toString(), e))).toList(), 
      'i1': i1, 
      's1': s1, 
      'd2': d2, 
      'd1': d1, 
      's2': s2.toList(), 
      'listbool': listbool, 
      'i4': i4, 
      's4': s4, 
      's5': s5, 
    };
  }

    
  factory TypeVarable2.fromMap(Map<String, dynamic> map) {
    return TypeVarable2(
      enumTypeRun: EnumTypeRun.values[map['enumTypeRun'] as int], 
      m: map['m'] as Map<String, dynamic>, 
      m5: map['m5'] as Map<String, dynamic>, 
      m6: map['m6'] as Map<String, dynamic>, 
      m3: map['m3'] as num?, 
      m4: map['m4'] as List<dynamic>, 
      id: map['id'] as int?, 
      listId: (map['listId'] as List<dynamic>).map((e) => (e as Map<String, dynamic>).map((k, e) => MapEntry(int.parse(k), e as String))).toList(), 
      i1: (map['i1'] as List<dynamic>).map((e) => e as int).toList(), 
      s1: (map['s1'] as List<dynamic>).map((e) => e as String).toList(), 
      d2: map['d2'] as List<dynamic>, 
      d1: (map['d1'] as List<dynamic>?)?.map((e) => (e as num).toDouble()).toList(), 
      s2: (map['s2'] as List<dynamic>).map((e) => e as String).toSet(), 
      listbool: (map['listbool'] as List<dynamic>?)?.map((e) => e as bool).toList(), 
      i4: map['i4'] as int, 
      s4: map['s4'] as String, 
      s5: map['s5'] as String?, 
    );
  }

  TypeVarable2 copyWith({
    EnumTypeRun? enumTypeRun,
    Map<String, dynamic>? m,
    Map<dynamic, dynamic>? m5,
    Map? m6,
    num? m3,
    List? m4,
    int? id,
    List<Map<int, String>>? listId,
    List<int>? i1,
    List<String>? s1,
    List<dynamic>? d2,
    List<double>? d1,
    Set<String>? s2,
    List<bool>? listbool,
    int? i4,
    String? s4,
    String? s5,
  }) {
    return TypeVarable2(
      enumTypeRun: enumTypeRun ?? this.enumTypeRun, 
      m: m ?? this.m, 
      m5: m5 ?? this.m5, 
      m6: m6 ?? this.m6, 
      m3: m3 ?? this.m3, 
      m4: m4 ?? this.m4, 
      id: id ?? this.id, 
      listId: listId ?? this.listId, 
      i1: i1 ?? this.i1, 
      s1: s1 ?? this.s1, 
      d2: d2 ?? this.d2, 
      d1: d1 ?? this.d1, 
      s2: s2 ?? this.s2, 
      listbool: listbool ?? this.listbool, 
      i4: i4 ?? this.i4, 
      s4: s4 ?? this.s4, 
      s5: s5 ?? this.s5, 
    );
  }
  
  String toJson() => json.encode(toMap());
  
    
  factory TypeVarable2.fromJson(String source) => TypeVarable2.fromMap(json.decode(source) as Map<String, dynamic>);
  
  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TypeVarable2 &&
            (identical(other.enumTypeRun, enumTypeRun) || other.enumTypeRun == enumTypeRun)&& 
            const DeepCollectionEquality().equals(other.m, m)&& 
            const DeepCollectionEquality().equals(other.m5, m5)&& 
            const DeepCollectionEquality().equals(other.m6, m6)&& 
            (identical(other.m3, m3) || other.m3 == m3)&& 
            const DeepCollectionEquality().equals(other.m4, m4)&& 
            (identical(other.id, id) || other.id == id)&& 
            const DeepCollectionEquality().equals(other.listId, listId)&& 
            const DeepCollectionEquality().equals(other.i1, i1)&& 
            const DeepCollectionEquality().equals(other.s1, s1)&& 
            const DeepCollectionEquality().equals(other.d2, d2)&& 
            const DeepCollectionEquality().equals(other.d1, d1)&& 
            const DeepCollectionEquality().equals(other.s2, s2)&& 
            const DeepCollectionEquality().equals(other.listbool, listbool)&& 
            (identical(other.i4, i4) || other.i4 == i4)&& 
            (identical(other.s4, s4) || other.s4 == s4)&& 
            (identical(other.s5, s5) || other.s5 == s5));
  }
  
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        enumTypeRun,
        const DeepCollectionEquality().hash(m),
        const DeepCollectionEquality().hash(m5),
        const DeepCollectionEquality().hash(m6),
        m3,
        const DeepCollectionEquality().hash(m4),
        id,
        const DeepCollectionEquality().hash(listId),
        const DeepCollectionEquality().hash(i1),
        const DeepCollectionEquality().hash(s1),
        const DeepCollectionEquality().hash(d2),
        const DeepCollectionEquality().hash(d1),
        const DeepCollectionEquality().hash(s2),
        const DeepCollectionEquality().hash(listbool),
        i4,
        s4,
        s5,
]);
  
  @override
  String toString() {
    return 'TypeVarable2(enumTypeRun: $enumTypeRun, m: $m, m5: $m5, m6: $m6, m3: $m3, m4: $m4, id: $id, listId: $listId, i1: $i1, s1: $s1, d2: $d2, d1: $d1, s2: $s2, listbool: $listbool, i4: $i4, s4: $s4, s5: $s5, )';
    }
  }
