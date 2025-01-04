import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan,
      appBar: AppBar(
        title: Text('Buttons'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
                style: ButtonStyle(
                    padding: WidgetStateProperty.all(EdgeInsets.all(20)),
                    overlayColor: WidgetStateProperty.all(
                        Colors.pinkAccent), //for hover effect
                    backgroundColor: WidgetStateProperty.all(Colors.yellow),
                    elevation: WidgetStateProperty.all(600)),
                onPressed: () => {},
                child: Text(
                  "Press It",
                  style: TextStyle(color: Colors.black, fontSize: 20),
                )),
            SizedBox(
              height: 80,
            ),
            Container(
                height: 80,
                width: 300,
                child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(
                          Theme.of(context).primaryColor),
                      shape: WidgetStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(60))),
                    ),
                    onPressed: () {},
                    child: Text("Elevated Button")))
          ],
        ),
      ),
    );
  }
}
