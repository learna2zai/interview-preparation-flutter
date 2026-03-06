import 'package:equatable/equatable.dart';
import 'package:interview_preparation_flutter/ui/screens/Auth/register/dto/register_response_model.dart';

sealed class RegisterState extends Equatable {}

class RegisterInitialState extends RegisterState {
  RegisterInitialState() : super();

  @override
  List<Object?> get props => [];
}

class RegisterLoadingState extends RegisterState {
  RegisterLoadingState() : super();

  @override
  List<Object?> get props => [];
}

class RegisterLoadedState extends RegisterState {
  final RegisterResponseModel registerResponseModel;
  RegisterLoadedState({required this.registerResponseModel}) : super();

  @override
  List<Object?> get props => [registerResponseModel];
}

class RegisterErrorState extends RegisterState {
  final String? errorMessage;
  RegisterErrorState({this.errorMessage}) : super();

  @override
  List<Object?> get props => [errorMessage];
}
