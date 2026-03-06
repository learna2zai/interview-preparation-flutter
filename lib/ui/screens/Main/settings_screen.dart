import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:go_router/go_router.dart';
import 'package:interview_preparation_flutter/config/constants.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Settings")),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: .end,
            crossAxisAlignment: .stretch,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amber[600],
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.all(Radius.circular(10)),
                  ),
                ),
                onPressed: () async {
                  FlutterSecureStorage().delete(key: Constants.accessToken);
                  context.go("/");
                },
                child: Text(
                  "Logout",
                  style: TextStyle(fontSize: 20, fontWeight: .bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
