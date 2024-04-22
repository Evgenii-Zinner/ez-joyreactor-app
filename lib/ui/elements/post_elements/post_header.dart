import 'package:ez_joyreactor_app/app.dart';
import 'package:flutter/material.dart';

class PostHeader extends StatelessWidget {
  const PostHeader({
    super.key,
    required this.userName,
    required this.userId,
    required this.postId,
  });

  final String userName;
  final String userId;
  final String postId;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AvatarImage(userId: userId),
        Text(userName),
        const Spacer(),
        NodeActionsMenuButton(
          nodeId: postId,
        )
      ],
    );
  }
}
