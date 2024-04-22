import 'package:flutter/material.dart';
import 'package:ez_joyreactor_app/ui/ui.dart';

class PostsFeedScreen extends StatelessWidget {
  const PostsFeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: PostsFeed(),
    );
  }
}
