import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase2/crud/FormUI2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyCustomerList extends StatelessWidget {
  const MyCustomerList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: TextButton.icon(
          onPressed: () {},
          // icon: Icon(Icons.list_alt, color: Colors.white),
          label: SizedBox.shrink(),
        ),
        title: Text("បញ្ជីអ្នកជំពាក់", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue,
      ),
      body: const MyStateListt(),
    );
  }
}

class MyStateListt extends StatelessWidget {
  const MyStateListt({super.key});

  @override
  Widget build(BuildContext context) {
    return  MyData();
  }
}

class MyForm extends StatefulWidget {
  final String id;
  final String customerName;
  final String phoneNumber;
  final String dob;
  final String balance;
  final String period;

  const MyForm({
    super.key,
    required this.id,
    required this.customerName,
    required this.phoneNumber,
    required this.dob,
    required this.balance,
    required this.period,
  });

  @override
  State<MyForm> createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  late TextEditingController _customerNameController;
  late TextEditingController _phoneNumberController;
  late TextEditingController _dobController;
  late TextEditingController _balanceController;
  late TextEditingController _periodController;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _customerNameController = TextEditingController(text: widget.customerName);
    _phoneNumberController = TextEditingController(text: widget.phoneNumber);
    _dobController = TextEditingController(text: widget.dob);
    _balanceController = TextEditingController(text: widget.balance);
    _periodController = TextEditingController(text: widget.period);
  }

  @override
  void dispose() {
    _customerNameController.dispose();
    _phoneNumberController.dispose();
    _dobController.dispose();
    _balanceController.dispose();
    _periodController.dispose();
    super.dispose();
  }

  Future<void> updateData() async {
    final CollectionReference fetchData = FirebaseFirestore.instance.collection("customer");

    await fetchData.doc(widget.id).update({
      'customerName': _customerNameController.text,
      'phoneNumber': _phoneNumberController.text,
      'dob': _dobController.text,
      'balance': double.parse(_balanceController.text),
      'period': _periodController.text,
    });

    Navigator.of(context).pop();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('បានកែប្រែដោយជោគជ័យ')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextFormField(
            controller: _customerNameController,
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
          SizedBox(height: 10),
          TextFormField(
            controller: _phoneNumberController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: "លេខទូរស័ព្ទ",
              labelStyle: TextStyle(fontSize: 20),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'សូមបញ្ចូលលេខទូរស័ព្ទ';
              }
              return null;
            },
          ),
          SizedBox(height: 10),
          TextFormField(
            controller: _dobController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: "ថ្ងៃខែឆ្នាំកំណើត",
              labelStyle: TextStyle(fontSize: 20),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'សូមបញ្ចូលថ្ងៃខែឆ្នាំកំណើត';
              }
              return null;
            },
          ),
          SizedBox(height: 10),
          TextFormField(
            controller: _balanceController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: "ចំនួន",
              labelStyle: TextStyle(fontSize: 20),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'សូមបញ្ចូលចំនួន';
              }
              return null;
            },
          ),
          SizedBox(height: 10),
          TextFormField(
            controller: _periodController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: "រយះពេលជំពាក់",
              labelStyle: TextStyle(fontSize: 20),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'សូមបញ្ចូលរយះពេលជំពាក់';
              }
              return null;
            },
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                updateData();
              }
            },
            child: Text("កែប្រែ"),
          ),
        ],
      ),
    );
  }
}



//data
class MyData extends StatefulWidget {
  const MyData({super.key});

  @override
  State<MyData> createState() => _MyDataState();
}

class _MyDataState extends State<MyData> {
  TextEditingController _searchController = TextEditingController();
  String _searchTerm = "";

  @override
  void initState() {
    super.initState();
    _searchController.addListener(() {
      setState(() {
        _searchTerm = _searchController.text;
      });
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  Future<void> deleteData(String id) async {
    final CollectionReference fetchData = FirebaseFirestore.instance.collection("customer");
    await fetchData.doc(id).delete();
  }

  Stream<int> getCountStream() {
    return FirebaseFirestore.instance.collection("customer").snapshots().map((snapshot) => snapshot.size);
  }

  Stream<double> getSum() {
    return FirebaseFirestore.instance.collection("customer").snapshots().map(
          (snapshot) {
        double sum = 0.0;
        for (var doc in snapshot.docs) {
          var balance = doc.data()['balance'] ?? 0.0;
          sum += balance.toDouble();
        }
        return sum;
      },
    );
  }

  Stream<QuerySnapshot> getFilteredData() {
    CollectionReference fetchData = FirebaseFirestore.instance.collection("customer");
    if (_searchTerm.isEmpty) {
      return fetchData.snapshots();
    } else {
      return fetchData
          .where('customerName', isGreaterThanOrEqualTo: _searchTerm)
          .where('customerName', isLessThanOrEqualTo: _searchTerm + '\uf8ff')
          .snapshots();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: EdgeInsets.all(10),
                child: Row(
                  children: [
                    Icon(Icons.add),
                    Text("មើលបញ្ជីទាំងអស់", style: TextStyle(fontSize: 20)),
                  ],
                ),
              ),
              IconButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => MyFormUI2()));
                },
                icon: Icon(Icons.add, color: Colors.blue),
              ),
            ],
          ),

          TextFormField(
            controller: _searchController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Search",
              labelStyle: TextStyle(fontSize: 20),
            ),
          ),

          Container(
            margin: EdgeInsets.all(30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Count data
                StreamBuilder<int>(
                  stream: getCountStream(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator();
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else {
                      return Text('ចំនួនសរុប: ${snapshot.data}', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold));
                    }
                  },
                ),
                // Sum data
                StreamBuilder<double>(
                  stream: getSum(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator();
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else {
                      return Text('សរុប: ${snapshot.data}', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold));
                    }
                  },
                ),
              ],
            ),
          ),
          SizedBox(height: 10),

          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: getFilteredData(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: Text("Loading....."));
                } else if (snapshot.hasError) {
                  return Center(child: Text("Error ${snapshot.error}"));
                } else if (snapshot.hasData) {
                  var docs = snapshot.data!.docs;
                  if (docs.isEmpty) {
                    return Center(child: Text("No Data Found"));
                  }
                  return ListView.builder(
                    itemCount: docs.length,
                    itemBuilder: (context, index) {
                      var doc = docs[index];
                      var data = doc.data() as Map<String, dynamic>;
                      return Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        margin: EdgeInsets.all(2),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("ឈ្មោះ: " + data["customerName"], style: TextStyle(color: Colors.greenAccent, fontSize: 20)),
                                Text("លេខទូរស័ព្ទ: " + data["phoneNumber"], style: TextStyle(color: Colors.white)),
                                Text("ថ្ងៃខែឆ្នាំកំណើត: " + data["dob"], style: TextStyle(color: Colors.white)),
                                Text("សម្យតុលសាច់ប្រាក់: " + data["balance"].toString(), style: TextStyle(color: Colors.white)),
                                Text("សរុប: " + data["period"].toString(), style: TextStyle(color: Colors.white)),
                              ],
                            ),
                            Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            title: Text("បញ្ជាក់"),
                                            content: Text("តើអ្នកពិតជាចង់លុបមែនទេ?"),
                                            actions: [
                                              ElevatedButton(
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                                child: Text("ត្រលប់"),
                                              ),
                                              ElevatedButton(
                                                onPressed: () {
                                                  deleteData(doc.id);
                                                  Navigator.of(context).pop();
                                                  ScaffoldMessenger.of(context).showSnackBar(
                                                    SnackBar(content: Text('បានលុបដោយជោគជ័យ')),
                                                  );
                                                },
                                                child: Text("លុប"),
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    },
                                    icon: Icon(Icons.delete, color: Colors.white),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            title: Text("កែប្រែ"),
                                            content: MyForm(
                                              id: doc.id,
                                              customerName: data["customerName"],
                                              phoneNumber: data["phoneNumber"],
                                              dob: data["dob"],
                                              balance: data["balance"].toString(),
                                              period: data["period"],
                                            ),
                                          );
                                        },
                                      );
                                    },
                                    icon: Icon(Icons.edit, color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                } else {
                  return Center(child: Text("No Data Found"));
                }
              },
            ),
          ),

        ],
      ),
    );
  }
}
