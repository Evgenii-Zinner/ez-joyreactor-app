
import 'package:flutter/material.dart';
import 'package:ez_joyreactor_app/ui/ui.dart';

class PostFooter extends StatelessWidget {
  const PostFooter({
    super.key,
    required this.postId,
    required this.createdAt,
    required this.rating,
    required this.voted,
  });

  final String postId;
  final DateTime createdAt;
  final double rating;
  final bool voted;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        PostActions(postId: postId, createdAt: createdAt),
        const Spacer(),
        Voter(nodeId: postId, rating: rating, voted: voted),
      ],
    );
  }
}
