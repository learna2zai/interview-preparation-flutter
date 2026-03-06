import 'package:interview_preparation_flutter/ui/screens/Auth/register/dto/register_request_model.dart';

sealed class RegisterEvent {}

class RegisterRequestEvent extends RegisterEvent {
  final RegisterRequestModel registerRequestModel;
  RegisterRequestEvent({required this.registerRequestModel});
}
