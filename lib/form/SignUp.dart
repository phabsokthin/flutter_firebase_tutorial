import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase2/form/Login.dart';
import 'package:firebase2/login/HomeScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MySignUp extends StatefulWidget {
  const MySignUp({super.key});

  @override
  State<MySignUp> createState() => _MySignUpState();
}

class _MySignUpState extends State<MySignUp> {
  @override
  Widget build(BuildContext context) {
    return SignupForm();
  }
}

class SignupForm extends StatefulWidget {
  const SignupForm({super.key});

  @override
  State<SignupForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<SignupForm> {
  // Add controllers to get input values
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  CollectionReference colRef = FirebaseFirestore.instance.collection("_users");

// Function to handle sign up

  Future<void> _handleSignUp() async {
    // Basic validation
    if (_nameController.text.trim().isEmpty) {
      _showMessage("Name cannot be empty", Colors.red);
      return;
    }

    if (_emailController.text.trim().isEmpty) {
      _showMessage("Email cannot be empty", Colors.red);
      return;
    }

    if (_passwordController.text.trim().isEmpty) {
      _showMessage("Password cannot be empty", Colors.red);
      return;
    }

    try {
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );

      String uId = userCredential.user!.uid;

      await colRef.doc(uId).set({
        'fullName': _nameController.text.trim(),
        'email': _emailController.text.trim(),
        // Ensure you handle passwords securely
      });

      _showMessage("Account created successfully!", Colors.green);

      // Clear the text fields
      _nameController.clear();
      _emailController.clear();
      _passwordController.clear();

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MyHomeLogin()),
      );

    } on FirebaseAuthException catch (e) {
      String message;
      switch (e.code) {
        case 'weak-password':
          message = 'The password provided is too weak.';
          break;
        case 'email-already-in-use':
          message = 'The account already exists for that email.';
          break;
        case 'invalid-email':
          message = 'The email address is not valid.';
          break;
        default:
          message = 'An unknown error occurred.';
          break;
      }
      _showMessage(message, Colors.red);
    } catch (e) {
      _showMessage("Error: ${e.toString()}", Colors.red);
    }
  }

// Helper function to show messages
  void _showMessage(String message, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: color,
      ),
    );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.only(top: 100),
              child: CircleAvatar(
                radius: 40,
                backgroundColor: Colors.blue,
                child: Icon(Icons.person, size: 40, color: Colors.white),
              ),
            ),
            SizedBox(height: 30),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 2),
              child: TextField(
                controller: _nameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: BorderSide.none,
                  ),
                  fillColor: Color(0xffE8E8E8),
                  filled: true,
                  hintText: 'Full Name',
                ),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 2),
              child: TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: BorderSide.none,
                  ),
                  fillColor: Color(0xffE8E8E8),
                  filled: true,
                  hintText: 'Email Address',
                ),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 2),
              child: TextField(
                controller: _passwordController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: BorderSide.none,
                  ),
                  fillColor: Color(0xffE8E8E8),
                  filled: true,
                  hintText: 'Password',
                ),
                obscureText: true,
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: _handleSignUp,
              child: Text("CREATE ACCOUNT", style: TextStyle(color: Colors.white)),
              style: ElevatedButton.styleFrom(
                fixedSize: Size(370, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                backgroundColor: Colors.blue,
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(width: 2),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => MyFormLogin()));
                  },
                  child: Text(
                    "Already have an account?",
                    style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            SizedBox(height: 35),
            Padding(
              padding: const EdgeInsets.only(left: 25, right: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 160,
                    height: 1,
                    color: Color(0xffA2A2A2),
                  ),
                  Text("OR", style: TextStyle(color: Colors.black)),
                  Container(
                    width: 160,
                    height: 1,
                    color: Color(0xffA2A2A2),
                  ),
                ],
              ),
            ),
            SizedBox(height: 15),
            Container(
              padding: EdgeInsets.only(left: 52, right: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FaIcon(FontAwesomeIcons.google, size: 20, color: Colors.orange),
                  SizedBox(width: 8),
                  GestureDetector(
                    onTap: () {
                      // Handle Google sign-in
                    },
                    child: Text("Connect with Google", style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ),
            SizedBox(height: 12),
            Container(
              padding: EdgeInsets.only(left: 70, right: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FaIcon(FontAwesomeIcons.facebook, size: 20, color: Colors.blue),
                  SizedBox(width: 8),
                  GestureDetector(
                    onTap: () {
                      // Handle Facebook sign-in
                    },
                    child: Text("Connect with Facebook", style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
