import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LinkButton extends StatelessWidget {
  const LinkButton({
    super.key,
    required this.postId,
    this.commentId,
  });

  final String postId;
  final String? commentId;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: IconButton(
        icon: const Icon(Icons.link),
        onPressed: () {
          String linkTrailing = utf8.decode(base64Decode(postId)).split(':')[1];
          if (commentId != null) {
            linkTrailing +=
                '#comment${utf8.decode(base64Decode(commentId!)).split(':')[1]}';
          }
          Clipboard.setData(
              ClipboardData(text: 'https://joyreactor.cc/post/$linkTrailing'));
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Ссылка скопированна в буфер'),
            ),
          );
        },
      ),
    );
  }
}
