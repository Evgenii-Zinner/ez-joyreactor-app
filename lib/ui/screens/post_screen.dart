import 'package:flutter/material.dart';

class PostScreen extends StatelessWidget {
  const PostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final String postId = ModalRoute.of(context)?.settings.arguments as String;

    return
      //TODO create one post with comments view
      const Scaffold(
      body: Placeholder(),
    );
  }
}
