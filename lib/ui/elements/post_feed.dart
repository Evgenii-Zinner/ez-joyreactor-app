import 'package:ez_joyreactor_app/app.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PostsFeed extends StatefulWidget {
  const PostsFeed({super.key});

  @override
  State<PostsFeed> createState() => _PostsFeedState();
}

class _PostsFeedState extends State<PostsFeed> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(_scrollListener);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<PostsProvider>(context, listen: false).fetchMorePosts(5);
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    var postsProvider = Provider.of<PostsProvider>(context, listen: false);
    int lastVisibleIndex = _scrollController.position.maxScrollExtent.round();
    if (lastVisibleIndex >= postsProvider.posts.length - 1 &&
        !postsProvider.isLoading) {
      postsProvider.fetchMorePosts(1);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<PostsProvider>(
      builder: (context, postsProvider, _) {
        return ListView.builder(
          controller: _scrollController,
          itemCount: postsProvider.posts.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: PostEntry(post: postsProvider.posts[index]),
            );
          },
        );
      },
    );
  }
}
