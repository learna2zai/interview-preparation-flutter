import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interview_preparation_flutter/ui/routes.dart';
import 'package:interview_preparation_flutter/ui/screens/Auth/login/bloc/login_bloc.dart';
import 'package:interview_preparation_flutter/ui/screens/Auth/register/bloc/register_bloc.dart';
import 'package:interview_preparation_flutter/ui/screens/Main/counter_page.dart';

Future<void> main() async {
  runApp(InterviewPreparationApp());
}

class InterviewPreparationApp extends StatelessWidget {
  const InterviewPreparationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CounterBloc()),
        BlocProvider(create: (context) => LoginBloc()),
        BlocProvider(create: (context) => RegisterBloc()),
      ],
      child: MaterialApp.router(
        routerConfig: router,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
