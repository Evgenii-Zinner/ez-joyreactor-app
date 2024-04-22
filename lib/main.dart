import 'package:provider/provider.dart';

import 'app.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => JoyreactorApiProvider()),
    ChangeNotifierProvider(create: (_) => PostsProvider()),
    ChangeNotifierProvider(create: (_) => CommentsProvider()),
    ChangeNotifierProvider(create: (_) => MutationsProvider()),
  ], child: const JoyreactorApp()));
}
