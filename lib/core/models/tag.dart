import 'package:flutter/material.dart';

class Tag {
  Tag({required this.tagName, required this.tagId});

  final String tagId;
  final String tagName;

  factory Tag.fromMap(Map<String, dynamic> map) {
    return Tag(
      tagId: map['tagId'],
      tagName: map['tagName'],
    );
  }
}