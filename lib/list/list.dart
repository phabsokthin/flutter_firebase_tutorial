import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MyList extends StatefulWidget {
  const MyList({Key? key}) : super(key: key);

  @override
  State<MyList> createState() => _MyListState();
}

class _MyListState extends State<MyList> {
  final CollectionReference fetchData = FirebaseFirestore.instance.collection("users");

  Future<void> deleteData(String id) async {
    await fetchData.doc(id).delete();
  }

  Future<void> updateData(String id, String userName, String password) async {
    await fetchData.doc(id).update({'userName': userName, 'password': password});
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Menu"),
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder(
              stream: fetchData.snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                if (streamSnapshot.hasData) {
                  return ListView.builder(
                    itemCount: streamSnapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      var doc = streamSnapshot.data!.docs[index];
                      var data = doc.data() as Map<String, dynamic>;

                      return Container(
                        margin: EdgeInsets.all(10),
                        padding: EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.blue,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  doc.id, // Display the document ID
                                  style: TextStyle(fontSize: 18.0, color: Colors.white),
                                ),
                                Text(
                                  data['userName'] ?? 'No name',
                                  style: TextStyle(fontSize: 18.0, color: Colors.white),
                                ),
                                Text(
                                  data['password'] ?? 'No password',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                            IconButton(
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text("Confirm Deletion"),
                                      content: Text("Are you sure you want to delete this user?"),
                                      actions: [
                                        ElevatedButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: Text("Cancel"),
                                        ),
                                        ElevatedButton(
                                          onPressed: () {
                                            deleteData(doc.id);
                                            Navigator.of(context).pop();
                                          },
                                          child: Text("Ok"),

                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                              icon: Icon(Icons.delete, color: Colors.red),
                            ),
                            IconButton(
                              onPressed: () {
                                TextEditingController usernameController = TextEditingController(text: data['userName']);
                                TextEditingController passwordController = TextEditingController(text: data['password']);
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text("Edit User"),
                                      content: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          TextField(
                                            controller: usernameController,
                                            decoration: InputDecoration(labelText: 'Name'),
                                          ),
                                          TextField(
                                            controller: passwordController,
                                            decoration: InputDecoration(labelText: 'Password'),
                                          ),
                                        ],
                                      ),
                                      actions: [
                                        ElevatedButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: Text("Cancel"),
                                        ),
                                        ElevatedButton(
                                          onPressed: () {
                                            updateData(doc.id, usernameController.text, passwordController.text);
                                            Navigator.of(context).pop();
                                          },
                                          child: Text("Update"),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                              icon: Icon(Icons.edit, color: Colors.green),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                } else if (streamSnapshot.hasError) {
                  return Center(child: Text('Error: ${streamSnapshot.error}'));
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
