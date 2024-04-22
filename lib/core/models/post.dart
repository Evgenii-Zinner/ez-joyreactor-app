import 'models.dart';
import 'package:flutter/material.dart';

class Post {
  Post({
    required this.postId,
    required this.user,
    required this.tags,
    this.attributes,
    required this.text,
    required this.commentsCount,
    required this.viewedCommentsCount,
    required this.createdAt,
    required this.nsfw,
    required this.rating,
    this.bestComments,
    required this.voted,
  });

  final String postId;
  final String text;
  final int commentsCount;
  final int viewedCommentsCount;
  final User user;
  final DateTime createdAt;
  final double rating;
  final bool voted;
  final bool nsfw;
  final List<Tag> tags;
  final List<Attribute>? attributes;
  final List<Comment>? bestComments;

  factory Post.fromMap(Map<String, dynamic> map) {
    return Post(
      postId: map['data']['node']['id'],
      text: map['data']['node']['text'] == '' ? '&attribute_insert_1&' : map['data']['node']['text'],
      commentsCount: map['data']['node']['commentsCount'],
      viewedCommentsCount: map['data']['node']['viewedCommentsCount'],
      user: User.fromMap(map['data']['node']['user']),
      createdAt: DateTime.parse(map['data']['node']['createdAt']),
      rating: map['data']['node']['rating'],
      voted: map['data']['node']['vote'] !=
          null, // Default to false if vote is null
      nsfw: map['data']['node']['nsfw'],
      tags: (map['data']['node']['tags'] as List<dynamic>).map((tagData) {
        return Tag.fromMap(tagData);
      }).toList(),
      attributes: (map['data']['node']['attributes'] as List<dynamic>?)
              ?.map((attributeData) {
            return Attribute.fromMap(attributeData);
          }).toList() ??
          [],
      bestComments: map['data']['node']['bestComments'] != []
          ? (map['data']['node']['bestComments'] as List<dynamic>)
              .map((commentData) {
              return Comment.fromMap(commentData, map['data']['node']['id']);
            }).toList()
          : [],
    );
  }
}
