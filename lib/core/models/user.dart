import 'package:flutter/material.dart';

class User {
  User({required this.userId, required this.userName});

  final String userId;
  final String userName;

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      userId: map['userId'],
      userName: map['userName'],
    );
  }
}