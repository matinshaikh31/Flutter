import 'package:flutter/material.dart';

class Container_Sized extends StatelessWidget {
  const Container_Sized({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Conatiner and sizedbox"),
      ),
      body: Center(
        child: Container(
          // padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: Colors.amber,
              // shape: BoxShape.circle
              // borderRadius: BorderRadius.circular(10)
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20)),
              boxShadow: [BoxShadow(blurRadius: 20, color: Colors.white60)]),
          height: 100,
          width: 100,
          child: Center(
              child: Container(
            margin: EdgeInsets.all(20),
            color: Colors.red,
          )),
        ),
      ),
    );
  }
}
