import 'package:flutter/material.dart';

class SnackbarWidget extends StatelessWidget {
  const SnackbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SnackBar"),
      ),
      body: Container(
        child: Center(
          child: ElevatedButton(
              onPressed: () {
                final snackBAr = SnackBar(
                  action: SnackBarAction(
                    label: "Undo",
                    onPressed: () {},
                    textColor: Colors.blue,
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  behavior: SnackBarBehavior.floating,
                  duration: const Duration(milliseconds: 2000),
                  content: Text("This is an Error"),
                  backgroundColor: Colors.red,
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBAr);
              },
              child: Text("Show SnackBar")),
        ),
      ),
    );
  }
}
