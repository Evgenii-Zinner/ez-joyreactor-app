import 'package:ez_joyreactor_app/core/core.dart';
import 'package:flutter/material.dart';

class Comment {
  Comment({
    required this.commentId,
    required this.user,
    this.attributes,
    required this.text,
    required this.createdAt,
    required this.rating,
    required this.level,
    required this.parent,
    required this.voted,
    required this.postId,
  });

  final String postId;
  final String commentId;
  final User user;

  final String text;
  final List<Attribute>? attributes;

  final DateTime createdAt;
  final double rating;
  final bool voted;

  final int level;
  final String parent;

  factory Comment.fromMap(Map<String, dynamic> map, String postId) {
    return Comment(
      commentId: map['id'],
      user: User.fromMap(map['user']),
      attributes: (map['attributes'] as List<dynamic>?)?.map((attributeData) {
        return Attribute.fromMap(attributeData);
      }).toList(),
      text: map['text'],
      createdAt: DateTime.parse(map['createdAt']),
      rating: map['rating'],
      level: map['level'],
      parent: map['parent']['id'],
      voted: map['voted'],
      postId: postId,
    );
  }
}
