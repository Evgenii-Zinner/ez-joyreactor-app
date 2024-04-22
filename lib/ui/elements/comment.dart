import 'package:ez_joyreactor_app/ui/elements/elements.dart';
import 'package:flutter/material.dart';
import 'package:ez_joyreactor_app/core/core.dart';
import 'package:ez_joyreactor_app/ui/ui.dart';

class CommentEntry extends StatelessWidget {
  const CommentEntry({
    super.key,
    required this.comment,
  });

  final Comment comment;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        //post offset
        Container(
          width: ((comment.level - 1) * 10),
          constraints: const BoxConstraints(
            minWidth: 0.0,
            maxWidth: 100, // Maximum width allowed
          ),
        ),
        Card(
          child: Column(
            children: [
              CommentContent(
                  text: comment.text,
                  attributes: comment.attributes,
                  commentId: comment.commentId),
              CommentFooter(
                  userName: comment.user.userName,
                  userId: comment.user.userId,
                  commentId: comment.commentId,
                  createdAt: comment.createdAt,
                  voted: comment.voted,
                  rating: comment.rating,
                  postId: comment.postId)
            ],
          ),
        ),
      ],
    );
  }
}
