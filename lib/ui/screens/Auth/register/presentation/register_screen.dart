import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:interview_preparation_flutter/ui/screens/Auth/register/bloc/register_bloc.dart';
import 'package:interview_preparation_flutter/ui/screens/Auth/register/bloc/register_event.dart';
import 'package:interview_preparation_flutter/ui/screens/Auth/register/bloc/register_state.dart';
import 'package:interview_preparation_flutter/ui/screens/Auth/register/dto/register_request_model.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterUserState();
}

class _RegisterUserState extends State<RegisterScreen> {
  late final TextEditingController _nameController;
  late final TextEditingController _emailController;
  late final TextEditingController _phoneController;
  late final TextEditingController _passwordController;
  late final TextEditingController _confirmPasswordController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _phoneController = TextEditingController();
    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();

    _nameController.text = "First User";
    _emailController.text = "first.user@gmail.com";
    _phoneController.text = "9898789876";
    _passwordController.text = "pass@123";
    _confirmPasswordController.text = "pass@123";
  }

  @override
  void dispose() {
    super.dispose();

    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
  }

  void _registerUser() async {
    context.read<RegisterBloc>().add(
      RegisterRequestEvent(
        registerRequestModel: RegisterRequestModel(
          name: _nameController.text,
          email: _emailController.text,
          phone: _phoneController.text,
          password: _passwordController.text,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterBloc, RegisterState>(
      listener: (context, state) {
        if (state is RegisterLoadedState) {
          context.go("/");
        }
      },
      builder: (context, state) => Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          forceMaterialTransparency: true,
          leading: Padding(
            padding: const EdgeInsets.all(16.0),
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.close_rounded),
            ),
          ),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                mainAxisAlignment: .center,
                children: [
                  Text(
                    "New User Registration",
                    style: TextStyle(
                      color: Colors.blueAccent,
                      fontSize: 24,
                      fontWeight: .bold,
                    ),
                  ),
                  Card(
                    shadowColor: Colors.grey,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 32,
                        horizontal: 16,
                      ),
                      child: Column(
                        mainAxisAlignment: .center,
                        mainAxisSize: .min,
                        crossAxisAlignment: .stretch,
                        children: [
                          TextField(
                            controller: _nameController,
                            decoration: InputDecoration(
                              labelText: "Name",
                              border: OutlineInputBorder(),
                            ),
                          ),
                          SizedBox(height: 16),
                          TextField(
                            controller: _emailController,
                            decoration: InputDecoration(
                              labelText: "Email",
                              border: OutlineInputBorder(),
                            ),
                          ),
                          SizedBox(height: 16),
                          TextField(
                            controller: _phoneController,
                            decoration: InputDecoration(
                              labelText: "Phone",
                              border: OutlineInputBorder(),
                            ),
                          ),
                          SizedBox(height: 16),
                          TextField(
                            controller: _passwordController,
                            obscureText: true,
                            decoration: InputDecoration(
                              labelText: "Password",
                              border: OutlineInputBorder(),
                            ),
                          ),
                          SizedBox(height: 16),
                          TextField(
                            controller: _confirmPasswordController,
                            obscureText: true,
                            decoration: InputDecoration(
                              labelText: "Confirm Password",
                              border: OutlineInputBorder(),
                            ),
                          ),
                          SizedBox(height: 24),
                          ElevatedButton(
                            onPressed: state is RegisterLoadingState
                                ? null
                                : _registerUser,
                            child: Row(
                              mainAxisAlignment: .center,
                              children: [
                                state is RegisterLoadingState
                                    ? SizedBox(
                                        width: 28,
                                        height: 28,
                                        child: CircularProgressIndicator(
                                          strokeWidth: 2,
                                          padding: EdgeInsets.all(4),
                                          color: Colors.grey,
                                        ),
                                      )
                                    : Icon(Icons.arrow_forward),
                                SizedBox(width: 8),
                                Text("Register"),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
