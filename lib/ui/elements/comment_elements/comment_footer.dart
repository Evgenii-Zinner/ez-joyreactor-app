import 'package:ez_joyreactor_app/app.dart';
import 'package:ez_joyreactor_app/ui/elements/elements.dart';
import 'package:flutter/material.dart';

class CommentFooter extends StatelessWidget {
  const CommentFooter({
    super.key,
    required this.userName,
    required this.userId,
    required this.commentId,
    required this.createdAt,
    required this.voted,
    required this.rating,
    required this.postId,
  });

  final String userName;
  final String userId;
  final String commentId;
  final String postId;
  final DateTime createdAt;
  final bool voted;
  final double rating;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AvatarImage(userId: userId),
        Text(userName),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(createdAt.toLocal().toString()),
        ),
        ReplyButton(
          nodeId: commentId,
        ),
        LinkButton(postId: postId, commentId: commentId),
        const Spacer(),
        Voter(nodeId: commentId, voted: voted, rating: rating)
      ],
    );
  }
}
