
import 'package:flutter/material.dart';
import 'package:ez_joyreactor_app/ui/ui.dart';

class Voter extends StatelessWidget {
  const Voter({
    super.key,
    required this.nodeId,
    required this.voted,
    required this.rating,
  });

  final String nodeId;
  final bool voted;
  final double rating;

  static const String plus = 'PLUS';
  static const String minus = 'MINUS';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            VoteButton(
              nodeId: nodeId,
              vote: plus,
            ),
            Rating(
              rating: rating,
              voted: voted,
            ),
            VoteButton(
              nodeId: nodeId,
              vote: minus,
            ),
          ],
        ),
      ),
    );
  }
}
