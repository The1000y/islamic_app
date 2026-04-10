import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';

class AzkaDataModel extends Equatable {
  final String? category;
  final String? count;
  final String? description;
  final String? reference;
  final String? content;

  const AzkaDataModel({
    this.category,
    this.count,
    this.description,
    this.reference,
    this.content,
  });

  factory AzkaDataModel.fromJson(Map<String, dynamic> json) {
    return AzkaDataModel(
      category: json['category'] as String?,
      count: json['count'] as String?,
      description: json['description'] as String?,
      reference: json['reference'] as String?,
      content: json['content'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
    'category': category,
    'count': count,
    'description': description,
    'reference': reference,
    'content': content,
  };

  @override
  List<Object?> get props {
    return [category, count, description, reference, content];
  }

  static Future<List<AzkaDataModel>> getAzkarContent(String azkarType) async {
    var data = jsonDecode(
      await rootBundle.loadString('assets/azkar/azkar.json'),
    );

    List<AzkaDataModel> azkarData = (data[azkarType] as List)
        .map((e) => AzkaDataModel.fromJson(e))
        .toList();

    return azkarData;

    // return (data as List).map((e) => AzkaDataModel.fromJson(e)).toList();
  }
}
