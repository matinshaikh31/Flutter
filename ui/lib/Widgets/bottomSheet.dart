import 'package:flutter/material.dart';

class BottomsheetWidget extends StatelessWidget {
  const BottomsheetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Bottom Sheet Navigation",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 255, 191, 0),
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              showModalBottomSheet(
                  backgroundColor: const Color.fromARGB(255, 255, 191, 0),
                  context: context,
                  builder: (context) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ListTile(
                          title: Text("Orange"),
                          subtitle: Text("I like Orange"),
                        ),
                        ListTile(
                          title: Text("Mango"),
                          subtitle: Text("I like Mango"),
                        ),
                        ListTile(
                          title: Text("Pineapple"),
                          subtitle: Text("I like Pineapple"),
                        ),
                        ListTile(
                          title: Text("Tomato"),
                          subtitle: Text("I like Tomato"),
                        ),
                      ],
                    );
                  });
            },
            child: Text("Click Me")),
      ),
    );
  }
}
