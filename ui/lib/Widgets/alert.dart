import 'package:flutter/material.dart';

class Alert extends StatelessWidget {
  const Alert({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Alert"),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              _showMydialog(context);
            },
            child: Text("Alert Box")),
      ),
    );
  }
}

Future<void> _showMydialog(BuildContext context) async {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: const Color.fromARGB(255, 47, 1, 253),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          title: Text("This is an alert"),
          content: SingleChildScrollView(
            child: ListBody(
              children: [Text("This is demo"), Text("This is a matin")],
            ),
          ),
          actions: [
            TextButton(onPressed: () {}, child: Text("Approved")),
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Cancel"))
          ],
        );
      });
}
