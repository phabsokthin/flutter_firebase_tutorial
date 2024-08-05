import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase2/crud/customerList.dart';
import 'package:flutter/material.dart';

class MyFormUI2 extends StatefulWidget {
  const MyFormUI2({super.key});

  @override
  State<MyFormUI2> createState() => _MyFormUIState();
}

class _MyFormUIState extends State<MyFormUI2> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isLoading = false;

  final TextEditingController customerName = TextEditingController();
  final TextEditingController phoneNumber = TextEditingController();
  final TextEditingController dob = TextEditingController();
  final TextEditingController balance = TextEditingController();
  final TextEditingController period = TextEditingController();

  CollectionReference collRef = FirebaseFirestore.instance.collection("customer");

  Future<void> saveData() async {
    await collRef.add({
      'customerName': customerName.text,
      'phoneNumber': phoneNumber.text,
      'dob': dob.text,
      'balance': double.parse(balance.text),
      'period': period.text,
    });
  }

  void clearData() {
    customerName.clear();
    phoneNumber.clear();
    dob.clear();
    balance.clear();
    period.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.list_alt, color: Colors.white),
          onPressed: () {},
        ),
        title: Text(
          "កត់បញ្ជីអ្នកជំពាក់",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              const Row(
                children: [
                  Icon(Icons.add, color: Colors.blue),
                  SizedBox(width: 8),
                  Text(
                    "បង្កើតបញ្ជី",
                    style: TextStyle(fontSize: 20, color: Colors.blue),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: customerName,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "ឈ្មោះអតិថិជន",
                        labelStyle: TextStyle(fontSize: 20),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'សូមបញ្ចូលឈ្មោះអតិថិជន';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      controller: phoneNumber,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "លេខទូរស័ព្ទ",
                        labelStyle: TextStyle(fontSize: 20),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "សូមបញ្ចូលលេខទូរស័ព្ទ";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      controller: dob,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "ទីកន្លែងកំណើត",
                        labelStyle: TextStyle(fontSize: 20),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "សូមបំចូលទីកន្លែងកំណើត";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      controller: balance,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "ចំនួនជំំពាក់",
                        labelStyle: TextStyle(fontSize: 20),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "សូមបំពេញចំនួនជំពាក់";
                        }
                        return null;
                      },
                      keyboardType: TextInputType.number,
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      controller: period,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "រយះពេលជំពាក់",
                        labelStyle: TextStyle(fontSize: 20),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "សូមបំពេញរយះពេលបង់ប្រាក់";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20),
                    isLoading
                        ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                           ElevatedButton(onPressed: (){}, child: Container(
                             child: Row(
                               children: [

                                 CircularProgressIndicator(color: Colors.orange,),
                                 SizedBox(width: 10,),
                                 Text("សូមរងចាំ..."),
                               ],
                             ),
                           ))
                          ],
                        )
                        : OutlinedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          setState(() {
                            isLoading = true;
                          });
                          await saveData();
                          clearData();
                          setState(() {
                            isLoading = false;
                          });
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('បានរក្សាទុកដោយជោគជ័យ')),
                          );
                        }
                      },

                      child: const Text('រក្សាទុក'),
                    ),

                    OutlinedButton(onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder:(context)=>MyCustomerList()));
                    }, child: Text("បញ្ជីអ្នកជំពាក់"))

                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
