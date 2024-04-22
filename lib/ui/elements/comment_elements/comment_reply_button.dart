
import 'package:flutter/material.dart';

class ReplyButton extends StatelessWidget {
  const ReplyButton({
    super.key,
    required this.nodeId,
  });

  final String nodeId;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        //TODO open reply section under comment
        onPressed: () {}, child: const Text('Ответить'),
      ),
    );
  }
}
