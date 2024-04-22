import 'package:flutter/material.dart';
import 'package:ez_joyreactor_app/core/core.dart';
import 'package:provider/provider.dart';

class VoteButton extends StatelessWidget {
  const VoteButton({
    super.key,
    required this.nodeId,
    required this.vote,
  });

  final String nodeId;
  final String vote;

  @override
  Widget build(BuildContext context) {
    Icon buttonIcon = vote == 'PLUS'
        ? const Icon(Icons.thumb_up_sharp)
        : const Icon(Icons.thumb_down_sharp);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: IconButton(
        icon: buttonIcon,
        onPressed: () {
          Provider.of<MutationsProvider>(context, listen: false)
              .vote(nodeId, vote);
        },
      ),
    );
  }
}
