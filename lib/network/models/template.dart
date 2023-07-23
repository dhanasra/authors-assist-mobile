// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'package:mobile/network/models/field.dart';

class Template extends Equatable {

  final String? tool;
  final String id;
  final String category;
  final String title;
  final String helperText;
  final Field? fields;
  final bool proFeature;

  const Template({
    this.tool,
    required this.id,
    required this.category,
    required this.title,
    required this.helperText,
    this.fields,
    this.proFeature = false,
  });

  Template copyWith({
    String? tool,
    String? id,
    String? category,
    String? title,
    String? helperText,
    Field? fields,
    bool? proFeature,
  }) {
    return Template(
      tool: tool ?? this.tool,
      id: id ?? this.id,
      category: category ?? this.category,
      title: title ?? this.title,
      helperText: helperText ?? this.helperText,
      fields: fields ?? this.fields,
      proFeature: proFeature ?? this.proFeature,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'tool': tool,
      'id': id,
      'category': category,
      'title': title,
      'helperText': helperText,
      'fields': fields?.toMap(),
      'proFeature': proFeature,
    };
  }

  factory Template.fromMap(Map<String, dynamic> map) {
    return Template(
      tool: map['tool'] != null ? map['tool'] as String : null,
      id: map['id'] as String,
      category: map['category'] as String,
      title: map['title'] as String,
      helperText: map['helperText'] as String,
      fields: map['fields'] != null ? Field.fromMap(map['fields']) : null,
      proFeature: map['proFeature'] != null ? map['proFeature'] as bool : false,
    );
  }

  String toJson() => json.encode(toMap());

  factory Template.fromJson(String source) => Template.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      tool??'',
      id,
      category,
      title,
      helperText,
      fields??'',
      proFeature
    ];
  }
}
