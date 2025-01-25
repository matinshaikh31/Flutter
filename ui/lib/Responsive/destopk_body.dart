import 'package:flutter/material.dart';

class DestopkBody extends StatelessWidget {
  const DestopkBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[200],
      appBar: AppBar(
        title: Text("Mobile View"),
      ),
      body: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(10),
                  child: AspectRatio(
                    aspectRatio: 16 / 9,
                    child: Container(
                      color: Colors.deepPurple[400],
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                      itemCount: 8,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.all(10),
                          child: Container(
                            color: Colors.deepPurple[400],
                            height: 120,
                          ),
                        );
                      }),
                )
              ],
            ),
          ),
          Container(
            width: 200,
            color: Colors.deepPurple[400],
          )
        ],
      ),
    );
  }
}
