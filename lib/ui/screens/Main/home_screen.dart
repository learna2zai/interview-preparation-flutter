import 'package:flutter/material.dart';
import 'package:interview_preparation_flutter/models/user.dart';
import 'package:interview_preparation_flutter/services/user_repository.dart';
import 'package:interview_preparation_flutter/ui/screens/Main/user_details.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<User> users = [];

  @override
  void initState() {
    super.initState();
    _getUsers();
  }

  void _getUsers() async {
    final result = await UserRepository().loadUsers();
    // result.forEach((element) => print(element.name));
    setState(() {
      users = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text("Home"),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.refresh))],
      ),
      body: users.isNotEmpty
          ? ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                var user = users[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (ctx) => UserDetails(user: user),
                      ),
                    );
                  },
                  child: Hero(
                    tag: "user_details-${index.toString()}",
                    child: ListTile(
                      leading: Icon(Icons.person_outline_sharp),
                      title: Text(user.name),
                      subtitle: Text(user.email),
                      trailing: Text(user.phone),
                      iconColor: Colors.amber,
                    ),
                  ),
                );
              },
            )
          : Text("Loading...."),
    );
  }
}
