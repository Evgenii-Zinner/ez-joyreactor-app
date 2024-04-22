import 'package:flutter/material.dart';
import 'ui/ui.dart';
import 'core/core.dart';
import 'app_router.dart';
export 'ui/ui.dart';
export 'core/core.dart';

class JoyreactorApp extends StatelessWidget {
  const JoyreactorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      routes: AppRouter.routes,
      initialRoute: AppRouter.postsFeed,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orangeAccent),
        useMaterial3: true,
      ),
      home: const PostsFeed(),
    );
  }
}
