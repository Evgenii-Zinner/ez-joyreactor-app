import 'package:flutter/material.dart';
import 'package:ez_joyreactor_app/core/core.dart';
import 'package:ez_joyreactor_app/ui/ui.dart';

class PostEntry extends StatelessWidget {
  const PostEntry({
    super.key,
    required this.post,
  });

  final Post post;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 600,
      child: Card(clipBehavior: Clip.hardEdge,
        child: Column(
          children: [
            PostHeader(
              userName: post.user.userName,
              userId: post.user.userId,
              postId: post.postId,
            ),
            ClipRect(
                child:
                    PostContent(attributes: post.attributes, text: post.text)),
            PostFooter(
                postId: post.postId,
                createdAt: post.createdAt,
                rating: post.rating,
                voted: post.voted),
            BestComments(
              bestComments: post.bestComments,
            ),
          ],
        ),
      ),
    );
  }
}
