import 'package:flutter/material.dart';

import 'package:ez_joyreactor_app/ui/ui.dart';
import 'package:provider/provider.dart';
import 'package:ez_joyreactor_app/core/core.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Test'),
          ElevatedButton(
              onPressed: () {
                Provider.of<PostsProvider>(context, listen: false)
                    .fetchMorePosts(1);
              },
              child: const Text('FetchMore')),
          ElevatedButton(
            onPressed: () async {
              String login = 'el_farmazon';
              String password = 'n4fvczSdD';

              bool status =
                  await Provider.of<MutationsProvider>(context, listen: false)
                      .login(login, password);
              debugPrint('Login: $login, Password: $password');
              if (!status) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Wrong login or password')),
                );
                return;
              }
            },
            child: const Text('Login'),
          ),
          Checkbox(
            value: Provider.of<PostsProvider>(context, listen: false).isLoading,
            onChanged: (bool? value) {},
          ),
          SizedBox(width: 500, height: 500,
            child: Consumer<PostsProvider>(
              builder: (context, postsProvider, _) {
                final post = postsProvider.posts.isNotEmpty ? postsProvider.posts.last : null;
                return post != null ? PostEntry(post: post) : const SizedBox(); // Use your PostEntry widget
              },
            ),
          ),
        ],
      ),
    );
  }
}
