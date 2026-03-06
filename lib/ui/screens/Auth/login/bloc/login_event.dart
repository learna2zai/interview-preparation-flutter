import 'package:interview_preparation_flutter/ui/screens/Auth/login/dto/login_request_model.dart';

sealed class LoginEvent {}

class LoginRequestEvent extends LoginEvent {
  final LoginRequestModel loginRequestModel;

  LoginRequestEvent({required this.loginRequestModel});
}
