import 'package:flutter/material.dart';

class DismissableUi extends StatefulWidget {
  const DismissableUi({super.key});

  @override
  State<DismissableUi> createState() => _DismissableUiState();
}

class _DismissableUiState extends State<DismissableUi> {
  @override
  Widget build(BuildContext context) {
    List<String> fruits = ["Mango", "Orange", "Liche", "Tomato"];
    return Scaffold(
      appBar: AppBar(
        title: Text("Dismissable"),
        backgroundColor: Colors.amber,
      ),
      body: ListView.builder(
        itemCount: fruits.length,
        itemBuilder: (context, index) {
          final fruit = fruits[index];
          return Dismissible(
              onDismissed: (direcation) {
                if (direcation == DismissDirection.startToEnd) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(fruits[index]),
                    backgroundColor: Colors.red,
                  ));
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(fruits[index]),
                    backgroundColor: Colors.green,
                  ));
                }
              },
              key: Key(fruit),
              background: Container(
                color: Colors.red,
              ),
              secondaryBackground: Container(
                color: Colors.green,
              ),
              child: Card(
                child: ListTile(
                  title: Text(fruits[index]),
                ),
              ));
        },
      ),
    );
  }
}
