import 'package:ez_joyreactor_app/app.dart';
import 'package:flutter/material.dart';

class CommentContent extends StatelessWidget {
  const CommentContent({
    super.key,
    required this.text,
    required this.attributes,
    required this.commentId,
  });

  final String text;
  final List<Attribute>? attributes;
  final String commentId;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        NodeContent(
          nodeText: text,
          nodeAttributes: attributes,
          nodeType: 'comment',
        ),
        NodeActionsMenuButton(nodeId: commentId)
      ],
    );
  }
}
