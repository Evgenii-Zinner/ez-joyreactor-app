import 'package:ez_joyreactor_app/ui/elements/universal_elements/fav_button.dart';
import 'package:flutter/material.dart';
import 'package:ez_joyreactor_app/app.dart';

class PostActions extends StatelessWidget {
  const PostActions({
    super.key,
    required this.postId,
    required this.createdAt,
  });

  final String postId;
  final DateTime createdAt;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CommentsButton(postId: postId),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(createdAt.toLocal().toString().split(' ')[0]),
        ),
        //TODO insert buttons in menu?
        // LinkButton(postId: postId),
        // FavButton(postId: postId),
      ],
    );
  }
}
