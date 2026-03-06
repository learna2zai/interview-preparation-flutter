import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:interview_preparation_flutter/ui/screens/Auth/login/bloc/login_bloc.dart';
import 'package:interview_preparation_flutter/ui/screens/Auth/login/bloc/login_event.dart';
import 'package:interview_preparation_flutter/ui/screens/Auth/login/bloc/login_states.dart';
import 'package:interview_preparation_flutter/ui/screens/Auth/login/dto/login_request_model.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController _nameController;
  late TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _handleLogin() async {
    context.read<LoginBloc>().add(
      LoginRequestEvent(
        loginRequestModel: LoginRequestModel(
          email: _nameController.text,
          password: _passwordController.text,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is LoginLoadedState) {
          context.go("/home");
        }
      },
      builder: (context, state) => Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: constraints.maxHeight,
                    ),
                    child: Column(
                      mainAxisAlignment: .center,
                      crossAxisAlignment: .stretch,
                      children: [
                        Text(
                          "Welcome Back",
                          style: TextStyle(
                            fontSize: 36,
                            fontWeight: .bold,
                            color: Colors.blueAccent,
                          ),
                          textAlign: .center,
                        ),
                        Text(
                          "Login to do for exciting things...!!",
                          style: TextStyle(color: Colors.grey, fontSize: 16),
                          textAlign: .center,
                        ),
                        SizedBox(height: 24),
                        TextField(
                          controller: _nameController,
                          keyboardType: .emailAddress,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                            labelText: "Username",
                          ),
                        ),
                        SizedBox(height: 16),
                        TextField(
                          controller: _passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                            labelText: "Password",
                          ),
                        ),
                        if (state is LoginErrorState)
                          Padding(
                            padding: const EdgeInsets.only(top: 16.0),
                            child: Text(
                              state.errorMessage ?? "Unknown Error!!!",
                              style: TextStyle(
                                color: Colors.red,
                                fontWeight: .w600,
                              ),
                              textAlign: .center,
                            ),
                          ),
                        SizedBox(height: 24),
                        ElevatedButton(
                          onPressed: state is LoginLodingState
                              ? null
                              : _handleLogin,
                          child: Text(
                            state is LoginLodingState ? "Loading..." : "Login",
                            style: TextStyle(fontSize: 20, fontWeight: .bold),
                          ),
                        ),
                        SizedBox(height: 16),
                        TextButton(
                          onPressed: () {
                            context.push("/register");
                          },
                          child: Text("Register"),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
