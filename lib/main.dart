import 'package:firebase2/crud/FormUI2.dart';
import 'package:firebase2/firebase_options.dart';
import 'package:firebase2/form/Login.dart';
import 'package:firebase2/list/list.dart';
import 'package:firebase2/login/HomeScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {


    return MaterialApp(
      // home: MYHome(),
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot){
          if(snapshot.hasData){
            return const MyHomeLogin();
          }
          else{
            return const MyFormLogin();
          }
        },
      ),
    );
  }
}

class MYHome extends StatefulWidget {
  const MYHome({super.key});

  @override
  State<MYHome> createState() => _MYHomeState();
}

class _MYHomeState extends State<MYHome> {
  @override
  Widget build(BuildContext context) {
    // final username = TextEditingController();
    // final password = TextEditingController();
    // return Scaffold(
    //     appBar: AppBar(
    //       title: const Text("Meneu"),
    //     ),
    //     body: Center(
    //       child: Padding(
    //         padding: const EdgeInsets.all(8.0),
    //         child: Container(
    //           child: Column(
    //             children: [
    //               TextFormField(
    //                 controller: username,
    //                 decoration: const InputDecoration(
    //                   border: OutlineInputBorder(),
    //                   hintText: "UserName",
    //                 ),
    //               ),
    //               const SizedBox(height: 10),
    //               TextFormField(
    //                 controller: password,
    //                 decoration: const InputDecoration(
    //                   border: OutlineInputBorder(),
    //                   hintText: "Password",
    //                 ),
    //               ),
    //               const SizedBox(height: 10),
    //               ElevatedButton(
    //                 onPressed: () async {
    //
    //                   CollectionReference collRef = FirebaseFirestore.instance.collection("users");
    //                   await collRef.add({
    //                     'userName': username.text,
    //                     'password': password.text,
    //                   });
    //                   print("Save Successfull!");
    //                   username.clear();
    //                   password.clear();
    //
    //                 },
    //                 child: const Text("Save"),
    //               ),
    //
    //               ElevatedButton(
    //                 child: const Text('Open route'),
    //                 onPressed: () {
    //                   // Navigate to second route when tapped.
    //                   Navigator.push(
    //                     context,
    //                     MaterialPageRoute(builder: (context) => MyList()),
    //                   );
    //                 },
    //               ),
    //             ],
    //           ),
    //         ),
    //       ),
    //     ),
    //   );

    return MaterialApp(
      home: MyFormUI2(),
    );
  }
}

