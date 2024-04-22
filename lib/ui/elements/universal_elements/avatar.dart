import 'dart:convert';

import 'package:flutter/material.dart';

class AvatarImage extends StatelessWidget {
  const AvatarImage({
    super.key,
    required this.userId,
  });

  final String userId;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          image: DecorationImage(
            image: NetworkImage(
                'https://img2.joyreactor.cc/pics/avatar/user/${int.parse(utf8.decode(base64Decode(userId)).split(':')[1])}'),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
