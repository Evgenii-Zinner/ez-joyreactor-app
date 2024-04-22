import 'package:flutter/widgets.dart';
import 'package:ez_joyreactor_app/ui/ui.dart';

class AppRouter {
  AppRouter._();

  static const String login = '/signup';
  static const String postsFeed = '/postsFeed';
  static const String post = '/post';
  static const String userPage = '/userPage';
  static const String testPage = '/testPage';

  static final routes = <String, WidgetBuilder>{
    login: (BuildContext context) => const LoginScreen(),
    postsFeed: (BuildContext context) => const PostsFeedScreen(),
    post: (BuildContext context) => const PostScreen(),
    //TODO create user screen
    userPage: (BuildContext context) => const Placeholder(),
    testPage: (BuildContext context) => const TestScreen(),
  };
}
