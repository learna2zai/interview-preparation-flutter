import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interview_preparation_flutter/services/auth_repository.dart';
import 'package:interview_preparation_flutter/ui/screens/Auth/register/bloc/register_event.dart';
import 'package:interview_preparation_flutter/ui/screens/Auth/register/bloc/register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(RegisterInitialState()) {
    on<RegisterRequestEvent>((event, emit) async {
      emit(RegisterLoadingState());
      await Future.delayed(Duration(seconds: 5));
      try {
        final response = await AuthRepository().register(
          event.registerRequestModel,
        );

        emit(RegisterLoadedState(registerResponseModel: response));
      } catch (e) {
        emit(RegisterErrorState(errorMessage: e.toString()));
      }
    });
  }
}
