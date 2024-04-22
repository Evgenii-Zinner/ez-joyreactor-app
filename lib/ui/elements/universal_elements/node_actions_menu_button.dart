import 'package:flutter/material.dart';

class NodeActionsMenuButton extends StatelessWidget {
  const NodeActionsMenuButton({
    super.key,
    required this.nodeId,
  });

  final String nodeId;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: IconButton(
        icon: const Icon(Icons.more_vert),
        //TODO implement and show menu to report and other stuff
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Пока не работает'),
            ),
          );
        },
      ),
    );
  }
}
