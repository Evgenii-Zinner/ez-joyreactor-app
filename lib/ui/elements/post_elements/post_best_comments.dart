
import 'package:flutter/material.dart';
import 'package:ez_joyreactor_app/core/core.dart';
import 'package:ez_joyreactor_app/ui/ui.dart';

class BestComments extends StatelessWidget {
  const BestComments({
    super.key,
    required this.bestComments,
  });

  final List<Comment>? bestComments;

  @override
  Widget build(BuildContext context) {
    //TODO fix it
    // if (bestComments != null) {
    //   return ListView.builder(
    //     itemCount: bestComments!.length,
    //     itemBuilder: (context, index) {
    //       return CommentEntry(comment: bestComments![index]);
    //     },
    //   );
    // } else {
    //   return const SizedBox.shrink();
    // }
    return const SizedBox.shrink();
  }
}
