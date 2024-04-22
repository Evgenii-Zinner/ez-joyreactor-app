import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ez_joyreactor_app/core/core.dart';
import 'package:provider/provider.dart';

class MutationsProvider extends JoyreactorApiProvider {
  Future<bool> login(String login, String password) async {
    bool status = false;
    try {
      Response response = await api.sendRequest(logInMutation(login, password));

      if (response.statusCode == 200) {
        // Check if response contains errors
        if (response.data.containsKey('errors')) {
          // Handle error response
          List<dynamic> errors = response.data['errors'];
          for (var error in errors) {
            debugPrint("Error message: ${error['message']}");
          }
          // Handle authentication error
        } else {
          // No errors, handle successful login
          debugPrint(json.encode(response.data));
          status = true;
        }
      } else {
        debugPrint('Request failed with status: ${response.statusCode}');
        return false;
      }
    } catch (error) {
      debugPrint('Error sending POST request: $error');
    }
    notifyListeners();
    return status;
  }

  void favoritePost(String postId) {
    //TODO make mutation to add to fav
    notifyListeners();
  }

  void vote(String postId, String vote) {
    //TODO make mutation to vote post
    notifyListeners();
  }
}
