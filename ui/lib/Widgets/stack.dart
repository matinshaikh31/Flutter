import 'package:flutter/material.dart';

class StackWidget extends StatelessWidget {
  const StackWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Stack"),
      ),
      body: Container(
        color: Colors.blue,
        child: Center(
          child: Stack(
            children: [
              Center(
                child: Container(
                  height: 300,
                  width: 300,
                  color: Colors.red,
                ),
              ),
              Center(
                child: Container(
                  height: 150,
                  width: 150,
                  color: Colors.teal,
                ),
              ),
              Center(
                child: Container(
                  height: 50,
                  width: 50,
                  color: Colors.yellow,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
