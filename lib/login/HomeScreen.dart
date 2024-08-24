import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyHomeLogin extends StatefulWidget {
  const MyHomeLogin({super.key});

  @override
  State<MyHomeLogin> createState() => _MyHomeLoginState();
}

class _MyHomeLoginState extends State<MyHomeLogin> {
  User? _user;

  @override
  void initState() {
    super.initState();
    _fetchUser();
  }

  Future<void> _fetchUser() async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      setState(() {
        _user = user;
      });
    } catch (e) {
      print('Error fetching user: $e');
    }
  }

  Future<void> _signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      setState(() {
        _user = null;
      });
    } catch (e) {
      print('Sign out error: $e');
      // Optionally show an error message to the user
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Menu"),
        actions: [
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: _signOut,
          ),
        ],
      ),
      body: Center(
        child: Text(
          _user != null
              ? 'Welcome ${_user!.email}'
              : 'Not logged in',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
