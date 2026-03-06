import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:go_router/go_router.dart';
import 'package:interview_preparation_flutter/config/constants.dart';
import 'package:interview_preparation_flutter/ui/screens/Auth/login/presentation/login_screen.dart';
import 'package:interview_preparation_flutter/ui/screens/Auth/register/presentation/register_screen.dart';
import 'package:interview_preparation_flutter/ui/screens/Main/bottom_navigation.dart';
import 'package:interview_preparation_flutter/ui/screens/Main/home_screen.dart';

final router = GoRouter(
  redirect: (context, state) async {
    if (state.fullPath == '/register') {
      return state.path;
    }
    final token = await FlutterSecureStorage().read(key: Constants.accessToken);
    return token == null ? "/" : "/home";
  },
  routes: [
    GoRoute(path: "/", builder: (context, state) => LoginScreen()),
    GoRoute(path: "/register", builder: (context, state) => RegisterScreen()),
    GoRoute(path: "/home", builder: (context, state) => BottomNavigation()),
    GoRoute(path: "/users", builder: (context, state) => HomeScreen()),
  ],
  debugLogDiagnostics: true,
);
