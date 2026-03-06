import 'dart:convert';

import 'package:interview_preparation_flutter/config/constants.dart';
import 'package:interview_preparation_flutter/models/user.dart';
import 'package:http/http.dart' as http;

class UserRepository {
  UserRepository();

  Future<List<User>> loadUsers() async {
    final uri = Uri.http(Constants.host, "/users");

    try {
      final response = await http.get(
        uri,
        headers: {"Content-Type": "application/json"},
      );

      final List<dynamic> dynamicList = jsonDecode(response.body);

      return dynamicList.map((toElement) => User.fromJson(toElement)).toList();
    } catch (e) {
      return [];
    }
  }
}
