import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MyFormUI extends StatefulWidget {
  const MyFormUI({super.key});

  @override
  State<MyFormUI> createState() => _MyFormUIState();
}

class _MyFormUIState extends State<MyFormUI> {
  final customerName = TextEditingController();
  final phoneNumber = TextEditingController();
  final dob = TextEditingController();
  final balance = TextEditingController();
  final period = TextEditingController();

  CollectionReference collRef = FirebaseFirestore.instance.collection("customer");

  Future<void> saveData() async {
    await collRef.add({
      'customerName': customerName.text,
      'phoneNumber': phoneNumber.text,
      'dob': dob.text,
      'balance': balance.text,
      'period': period.text,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: TextButton.icon(
          onPressed: () {},
          icon: Icon(Icons.list_alt, color: Colors.white),
          label: Text(""),
        ),
        title: Text("កត់បញ្ជីអ្នកជំពាក់", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Icon(Icons.add, color: Colors.blue),
                      Text("បង្កើតបញ្ចី", style: TextStyle(fontSize: 20, color: Colors.blue)),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  TextFormField(
                    controller: customerName,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "ឈ្មោះអតិថិជន",
                      focusColor: Colors.blue,
                      labelStyle: TextStyle(fontSize: 20),
                    ),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: phoneNumber,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "លេខទូរស័ព្ទ",
                      focusColor: Colors.blue,
                      labelStyle: TextStyle(fontSize: 20),
                    ),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: dob,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "ទីកន្លែងកំណើត",
                      focusColor: Colors.blue,
                      labelStyle: TextStyle(fontSize: 20),
                    ),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: balance,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "ចំនួនជំពាក់",
                      focusColor: Colors.blue,
                      labelStyle: TextStyle(fontSize: 20),
                    ),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: period,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "រយះពេលជំពាក់",
                      focusColor: Colors.blue,
                      labelStyle: TextStyle(fontSize: 20),
                    ),
                  ),
                  SizedBox(height: 20),
                  OutlinedButton(
                    onPressed: () async {
                      await saveData();
                      print("Save Success");
                    },
                    child: const Text('រក្សាទុក'),
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
