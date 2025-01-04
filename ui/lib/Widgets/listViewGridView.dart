import 'package:flutter/material.dart';

class Listviewgridview extends StatefulWidget {
  const Listviewgridview({super.key});

  @override
  State<Listviewgridview> createState() => _ListviewgridviewState();
}

class _ListviewgridviewState extends State<Listviewgridview> {
  @override
  Widget build(BuildContext context) {
    List<String> fruits = ["Mango", "Orange", "Banana", "ChiiliFry"];
    Map fruits_person = {
      "names": ["Matin", "shaikh", "fezan", "aadil"],
      "fruit": ["Mango", "Orange", "Banana", "ChiiliFry"],
    };
    return Scaffold(
      appBar: AppBar(
        title: Text("List & Grid View"),
        backgroundColor: Colors.red,
      ),
      body: GridView.builder(
          itemCount: fruits.length,
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
          itemBuilder: (context, index) {
            return Card(
                child: Center(
              child: Text(fruits[index]),
            ));
          }),
      // body: GridView(
      //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      //       crossAxisCount: 3, crossAxisSpacing: 20, mainAxisSpacing: 20,childAspectRatio: 1/2),//crossAxisCount detrimind no of elements in one row,childAspectRatio width/height
      //   children: [
      //     Card(
      //       child: Text("Orage"),
      //     ),
      //     Card(
      //       child: Text("Orage"),
      //     ),
      //     Card(
      //       child: Text("Orage"),
      //     ),
      //     Card(
      //       child: Text("Orage"),
      //     ),
      //     Card(
      //       child: Text("Orage"),
      //     ),
      //     Card(
      //       child: Text("Orage"),
      //     )
      //   ],
      // ),
      // body: Container(
      //   child: ListView.builder(
      //       itemCount: fruits.length,
      //       itemBuilder: (context, index) {
      //         return Card(
      //           child: ListTile(
      //             leading: Icon(Icons.person),
      //             title: Text(fruits_person["fruit"][index]),
      //             subtitle: Text(fruits_person["names"][index]),
      //           ),
      //         );
      //       }),
      // ),
      // body: ListView(
      //   children: [
      //     Card(
      //         child: ListTile(
      //       title: Text("Orange"),
      //       subtitle: Text("Matin"),
      //     )),
      //     Card(
      //         child: ListTile(
      //       title: Text("Orange"),
      //       subtitle: Text("Matin"),
      //     )),
      //     Card(
      //         child: ListTile(
      //       title: Text("Orange"),
      //       subtitle: Text("Matin"),
      //     )),
      //     Card(
      //         child: ListTile(
      //       title: Text("Orange"),
      //       subtitle: Text("Matin"),
      //     )),
      //     Card(
      //         child: ListTile(
      //       title: Text("Orange"),
      //       subtitle: Text("Matin"),
      //     )),
      //     Card(
      //         child: ListTile(
      //       title: Text("Orange"),
      //       subtitle: Text("Matin"),
      //     )),
      //     Card(
      //         child: ListTile(
      //       title: Text("Orange"),
      //       subtitle: Text("Matin"),
      //     )),
      //     Card(
      //         child: ListTile(
      //       title: Text("Orange"),
      //       subtitle: Text("Matin"),
      //     )),
      //     Card(
      //         child: ListTile(
      //       title: Text("Orange"),
      //       subtitle: Text("Matin"),
      //     )),
      //   ],
      // ),
    );
  }
}
