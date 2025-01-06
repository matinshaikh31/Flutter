import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutterfirebase/widgets/rounded_button.dart';

class AddFirestoreData extends StatefulWidget {
  const AddFirestoreData({Key? key}) : super(key: key);

  @override
  State<AddFirestoreData> createState() => _AddFirestoreDataState();
}

class _AddFirestoreDataState extends State<AddFirestoreData> {
  final postController = TextEditingController();

  final fireStore = FirebaseFirestore.instance.collection("user");
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add FireStore Data'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            TextField(
              keyboardType: TextInputType.text,
              maxLines: 4,
              controller: postController,
              decoration: InputDecoration(
                  hintText: 'What is in your mind?',
                  border: OutlineInputBorder()),
            ),
            SizedBox(
              height: 30,
            ),
            RoundedButton(
                title: 'Add',
                loading: loading,
                onTap: () {
                  setState(() {
                    loading = true;
                  });
                  final id = DateTime.now().millisecondsSinceEpoch.toString();
                  fireStore.doc(id).set({
                    "Title": postController.text.toString(),
                    "id": id
                  }).then((value) {
                    setState(() {
                      loading = false;
                    });
                    ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: Text("Post Added")));
                  }).onError((error, StackTrace) {
                    setState(() {
                      loading = false;
                    });
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(error.toString())));
                  });
                })
          ],
        ),
      ),
    );
  }
}
