import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ddd extends StatefulWidget {
  const ddd({super.key});

  @override
  State<ddd> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<ddd> {
  final _authentication = FirebaseAuth.instance;
  User? loggedUser;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentUer();
  }

  void getCurrentUer() {
    try {
      final User = _authentication.currentUser;
      if (User != null) {
        loggedUser = User;
        print(loggedUser!.email);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("test")),
      body: Center(
        child: Text("tset"),
      ),
    );
  }
}
