import 'package:flutter/material.dart';

class RadialGaugeUseCase {
  final String title;
  final Widget widget;

  final int index;
  final String type;
  final String? description;
  final String? sourceCodePath;
  final String? sourceCodeUrl;

  RadialGaugeUseCase({
    required this.title,
    this.description,
    this.sourceCodePath,
    this.sourceCodeUrl,
    required this.widget,
    required this.index,
    required this.type,
  });

  factory RadialGaugeUseCase.fromJson(Map<String, dynamic> json) {
    return RadialGaugeUseCase(
      title: json['title'],
      description: json['description'],
      sourceCodePath: json['sourceCodePath'],
      sourceCodeUrl: json['sourceCodeUrl'],
      widget: json['widget'],
      index: json['index'],
      type: json['type'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'sourceCodePath': sourceCodePath,
      'sourceCodeUrl': sourceCodeUrl,
      'widget': widget,
      'index': index,
      'type': type,
    };
  }
}
