import 'package:flutter/material.dart';
import 'package:interview_preparation_flutter/models/user.dart';

class UserDetails extends StatelessWidget {
  const UserDetails({required this.user, super.key});

  final User user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("User Details")),
      body: Hero(
        tag: "user_details",
        child: Center(
          child: Card(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: .center,
                crossAxisAlignment: .start,
                mainAxisSize: .min,
                children: [
                  Text(
                    user.name.toUpperCase(),
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 24.0,
                      fontWeight: .bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    user.email,
                    style: TextStyle(color: Colors.grey, fontWeight: .bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    user.phone,
                    style: TextStyle(
                      color: Colors.grey,
                      // fontSize: 18.0,
                      fontWeight: .bold,
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
