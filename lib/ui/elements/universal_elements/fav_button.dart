import 'package:flutter/material.dart';
import 'package:ez_joyreactor_app/core/core.dart';
import 'package:provider/provider.dart';

class FavButton extends StatelessWidget {
  const FavButton({
    super.key,
    required this.postId,
  });

  final String postId;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: IconButton(
        icon: const Icon(Icons.star_border),
        onPressed: () {
          Provider.of<PostsProvider>(context, listen: false)
              .favoritePost(postId);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Пост добавлен в закладки'),
            ),
          );
        },
      ),
    );
  }
}
