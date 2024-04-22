
import 'package:flutter/material.dart';

import '../../../app_router.dart';

class UserName extends StatelessWidget {
  const UserName({
    super.key,
    required this.userName,
  });

  final String userName;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextButton(
          onPressed: () => Navigator.pushNamed(context, AppRouter.userPage,
              arguments: userName),
          child: Text(
              style: const TextStyle(decoration: TextDecoration.underline),
              userName),
        ));
  }
}
