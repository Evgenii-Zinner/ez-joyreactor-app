import 'package:ez_joyreactor_app/app_router.dart';
import 'package:flutter/material.dart';

class CommentsButton extends StatelessWidget {
  const CommentsButton({
    super.key,
    required this.postId,
  });

  final String postId;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: () =>
            Navigator.pushNamed(context, AppRouter.post, arguments: postId),
        child: const Icon(Icons.chat),
      ),
    );
  }
}
