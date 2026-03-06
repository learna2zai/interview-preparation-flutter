import 'package:equatable/equatable.dart';
import 'package:interview_preparation_flutter/ui/screens/Auth/login/dto/login_response_model.dart';

abstract class LoginState extends Equatable {}

class LoginInitialState extends LoginState {
  @override
  List<Object?> get props => [];
}

class LoginLodingState extends LoginState {
  @override
  List<Object?> get props => [];
}

class LoginLoadedState extends LoginState {
  final LoginResponseModel loginResponseModel;

  LoginLoadedState({required this.loginResponseModel});

  @override
  List<Object?> get props => [loginResponseModel];
}

class LoginErrorState extends LoginState {
  final String? errorMessage;

  LoginErrorState({this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}
