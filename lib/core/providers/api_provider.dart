import 'package:flutter/material.dart';
import 'package:ez_joyreactor_app/core/core.dart';

class JoyreactorApiProvider extends ChangeNotifier {
  late JoyreactorApi _api;

  JoyreactorApi get api => _api;

  JoyreactorApiProvider() {
    _initializeApi();
  }

  void _initializeApi() async {
    _api = JoyreactorApi();
    notifyListeners();
  }
}