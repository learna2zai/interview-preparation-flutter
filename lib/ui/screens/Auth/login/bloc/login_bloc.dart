import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interview_preparation_flutter/services/auth_repository.dart';
import 'package:interview_preparation_flutter/ui/screens/Auth/login/bloc/login_event.dart';
import 'package:interview_preparation_flutter/ui/screens/Auth/login/bloc/login_states.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitialState()) {
    on<LoginRequestEvent>((event, emit) async {
      emit(LoginLodingState());
      try {
        final loginResponseModel = await AuthRepository().login(
          event.loginRequestModel,
        );
        emit(LoginLoadedState(loginResponseModel: loginResponseModel));
      } catch (e) {
        emit(LoginErrorState(errorMessage: e.toString()));
      }
    });
  }
}
