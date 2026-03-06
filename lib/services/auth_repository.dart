import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:interview_preparation_flutter/config/constants.dart';
import 'package:interview_preparation_flutter/ui/screens/Auth/login/dto/login_request_model.dart';
import 'package:interview_preparation_flutter/ui/screens/Auth/login/dto/login_response_model.dart';
import 'package:interview_preparation_flutter/ui/screens/Auth/register/dto/register_request_model.dart';
import 'package:interview_preparation_flutter/ui/screens/Auth/register/dto/register_response_model.dart';

class AuthRepository {
  final Map<String, String> commonHeaders = {
    "Content-Type": "application/json",
  };

  Future<LoginResponseModel> login(LoginRequestModel loginRequestModel) async {
    final response = await http.post(
      Uri.http(Constants.host, "/auth/login"),
      headers: commonHeaders,
      body: jsonEncode(loginRequestModel.toJson()),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      await FlutterSecureStorage().write(
        key: Constants.accessToken,
        value: data["accessToken"],
      );
      return LoginResponseModel.fromJson(data);
    } else {
      throw Exception("Something went wrong. Error: ${response.body}");
    }
  }

  Future<RegisterResponseModel> register(
    RegisterRequestModel registerRequestModel,
  ) async {
    final uri = Uri.http(Constants.host, "/users/create-user");
    final response = await http.post(
      uri,
      headers: commonHeaders,
      body: jsonEncode(registerRequestModel.toJson()),
    );

    if (response.statusCode == 201) {
      final responseData = jsonDecode(response.body);
      return RegisterResponseModel.fromJson(responseData);
    } else {
      throw Exception("Something went wrong. Error: ${response.body}");
    }
  }
}
