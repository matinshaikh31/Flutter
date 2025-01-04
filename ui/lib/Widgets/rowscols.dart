import 'package:flutter/material.dart';

class Rowscols extends StatelessWidget {
  const Rowscols({super.key});

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amberAccent,
        title: Text("Rows and Cols"),
      ),
      body: Container(
          height: h,
          width: w,
          color: Colors.blue,
          // child: Row(
          //   mainAxisAlignment: MainAxisAlignment
          //       .spaceEvenly, //it is for verical alognment for row
          //   crossAxisAlignment:
          //       CrossAxisAlignment.end, //it is for horizontal alignmnet for row
          //   children: [
          //     Container(
          //       height: 60,
          //       width: 60,
          //       color: Colors.deepOrange,
          //     ),
          //     Container(
          //       height: 60,
          //       width: 60,
          //       color: Colors.purple,
          //     ),
          //     Container(
          //       height: 60,
          //       width: 60,
          //       color: Colors.green,
          //     ),
          //     Container(
          //       height: 60,
          //       width: 60,
          //       color: Colors.black,
          //     ),
          //     Container(
          //       height: 60,
          //       width: 60,
          //       color: Colors.pink,
          //     )
          //   ],
          // )),

          // child: Wrap(
          //   direction: Axis
          //       .vertical, // if the space is less than wrap help to wrap the conent by defaut for row it wrap horintal but if we want to wrap vertical we use this
          //   alignment: WrapAlignment.center,
          //   children: [
          //     Container(
          //       height: 60,
          //       width: 60,
          //       color: Colors.deepOrange,
          //     ),
          //     Container(
          //       height: 60,
          //       width: 60,
          //       color: Colors.purple,
          //     ),
          //     Container(
          //       height: 60,
          //       width: 60,
          //       color: Colors.green,
          //     ),
          //     Container(
          //       height: 60,
          //       width: 60,
          //       color: Colors.black,
          //     ),
          //     Container(
          //       height: 60,
          //       width: 60,
          //       color: Colors.pink,
          //     )
          //   ],
          // )),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 60,
                width: 60,
                color: Colors.deepOrange,
              ),
              Container(
                height: 60,
                width: 60,
                color: Colors.purple,
              ),
              Container(
                height: 60,
                width: 60,
                color: Colors.green,
              ),
              Container(
                height: 60,
                width: 60,
                color: Colors.black,
              ),
              Container(
                height: 60,
                width: 60,
                color: Colors.pink,
              )
            ],
          )),
    );
  }
}
