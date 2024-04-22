import 'dart:convert';

import 'package:flutter/material.dart';

class Attribute {
  Attribute({
    required this.attributeId,
    this.attributeInsertId,
    required this.attributeType,
    this.attributePictureId,
    this.attributePictureType,
    this.attributePictureExtension,
    this.attributeEmbedValue,
  });

  final String attributeId;
  final String attributeType;

  final int? attributeInsertId;
  final String? attributePictureId;
  final String? attributePictureType;
  final String? attributePictureExtension;
  final String? attributeEmbedValue;

  factory Attribute.fromMap(Map<String, dynamic> map) {
    return Attribute(
      attributeId: map['attributeId'],
      attributeInsertId: map['attributeInsertId'],
      attributeType: map['attributeType'],
      attributePictureId: map['attributePictureId'] != null
          ? utf8.decode(base64Decode(map['attributePictureId'])).split(':')[1]
          : null,
      attributePictureType: map['image']?['attributePictureType'],
      attributePictureExtension: map['image']?['attributePictureExtension'],
      attributeEmbedValue: map['attributeEmbedValue'],
    );
  }
}
