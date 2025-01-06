import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterfirebase/ui/auth/login_screen.dart';
import 'package:flutterfirebase/ui/firestore/add_firestore_data.dart';

class FirestoreListScreen extends StatefulWidget {
  const FirestoreListScreen({Key? key}) : super(key: key);

  @override
  State<FirestoreListScreen> createState() => _FirestoreListScreenState();
}

class _FirestoreListScreenState extends State<FirestoreListScreen> {
  final auth = FirebaseAuth.instance;
  final fireStore = FirebaseFirestore.instance.collection("user").snapshots();
  CollectionReference ref = FirebaseFirestore.instance.collection("user");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FireStore'),
        actions: [
          IconButton(
            onPressed: () {
              auth.signOut().then((value) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              }).onError((error, stackTrace) {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text(error.toString())));
              });
            },
            icon: Icon(Icons.logout_outlined),
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(height: 10),
          StreamBuilder<QuerySnapshot>(
            stream: fireStore,
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasError) {
                return Center(child: Text("An error occurred"));
              }

              return Expanded(
                child: ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    var doc = snapshot.data!.docs[index];
                    return ListTile(
                      title: Text(doc['Title'].toString()),
                      subtitle: Text(doc['id'].toString()),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: Icon(Icons.edit, color: Colors.blue),
                            onPressed: () {
                              _showUpdateDialog(doc);
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.delete, color: Colors.red),
                            onPressed: () {
                              _deleteDocument(doc.id);
                            },
                          ),
                        ],
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddFirestoreData()),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void _showUpdateDialog(QueryDocumentSnapshot doc) {
    TextEditingController titleController =
        TextEditingController(text: doc['Title']);

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Update Title'),
        content: TextField(
          controller: titleController,
          decoration: InputDecoration(labelText: 'Enter new title'),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              ref
                  .doc(doc.id)
                  .update({"Title": titleController.text}).then((value) {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Data updated successfully')),
                );
              }).onError((error, stackTrace) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(error.toString())),
                );
              });
            },
            child: Text('Update'),
          ),
        ],
      ),
    );
  }

  void _deleteDocument(String docId) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Delete Document'),
        content: Text('Are you sure you want to delete this document?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              ref.doc(docId).delete().then((value) {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Document deleted successfully')),
                );
              }).onError((error, stackTrace) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(error.toString())),
                );
              });
            },
            child: Text('Delete', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }
}
