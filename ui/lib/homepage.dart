import "package:flutter/material.dart";
import "package:ui/Widgets/button.dart";
import "package:ui/Widgets/container_sized.dart";
import "package:ui/Widgets/dismissable.dart";
import "package:ui/Widgets/drawer.dart";
import "package:ui/Widgets/dropDown.dart";
import "package:ui/Widgets/form.dart";
import "package:ui/Widgets/image.dart";
import "package:ui/Widgets/rowscols.dart";
import "package:ui/Widgets/snackBar.dart";
import "package:ui/Widgets/stack.dart";
import "package:ui/Widgets/tabBar.dart";

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List mapList = [
    {
      'onTapUi': DropdownWidget(),
      'text': 'Drop-Down Widget',
    },
    {
      'onTapUi': FormWidget(),
      'text': 'Form Widget',
    },
    {
      'onTapUi': TabbarWidget(),
      'text': 'TabBAr',
    },
    {
      'onTapUi': DismissableUi(),
      'text': 'Dismissable',
    },
    {
      'onTapUi': DrawerWidget(),
      'text': 'Drawer',
    },
    {
      'onTapUi': Rowscols(),
      'text': 'Rows And Cols',
    },
    {
      'onTapUi': SnackbarWidget(),
      'text': 'SNack Bar',
    },
    {
      'onTapUi': Container_Sized(),
      'text': 'Container & sized',
    },
    {
      'onTapUi': Button(),
      'text': 'Button',
    },
    {
      'onTapUi': StackWidget(),
      'text': 'Stack',
    },
    {
      'onTapUi': ImageWidget(),
      'text': 'Image Widget',
    },
  ];

  // Map Ui = {
  //   "element": [, FormWidget(), TabbarWidget()],
  //   "Text": ["", "Form Widget", "TabBarWidget"],
  // };
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("UI Designs Of Flutter"),
        backgroundColor: Colors.orange,
      ),
      body: GridView.builder(
          itemCount: mapList.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 5, crossAxisSpacing: 10, // Space between columns
            mainAxisSpacing: 10,
          ),
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => mapList[index]["onTapUi"],
                    ));
              },
              child: Container(
                height: 10,
                width: 10,
                child: Card(
                  color: Colors.orange[100], // Optional: Add a background color
                  child: Center(
                      child: Text(
                    mapList[index]['text'],
                    style: TextStyle(color: Colors.black),
                  )),
                ),
              ),
            );
          }),
      // body: GridView(
      //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      //     crossAxisCount: 3,
      //     crossAxisSpacing: 20,
      //     mainAxisSpacing: 20,
      //   ),
      //   children: [
      //     Card(
      //       color: Colors.blue,
      //       child: ElevatedButton(
      //           onPressed: () {
      //             Navigator.push(
      //                 context,
      //                 MaterialPageRoute(
      //                   builder: (context) => DropdownWidget(),
      //                 ));
      //           },
      //           child: Text("Text")),
      //     ),
      //     Card(
      //       color: Colors.blue,
      //       child: ElevatedButton(
      //           onPressed: () {
      //             Navigator.push(
      //                 context,
      //                 MaterialPageRoute(
      //                   builder: (context) => DropdownWidget(),
      //                 ));
      //           },
      //           child: Text("Text")),
      //     ),
      //     Card(
      //       color: Colors.blue,
      //       child: ElevatedButton(
      //           onPressed: () {
      //             Navigator.push(
      //                 context,
      //                 MaterialPageRoute(
      //                   builder: (context) => DropdownWidget(),
      //                 ));
      //           },
      //           child: Text("Text")),
      //     ),
      //     Card(
      //       color: Colors.blue,
      //       child: ElevatedButton(
      //           onPressed: () {
      //             Navigator.push(
      //                 context,
      //                 MaterialPageRoute(
      //                   builder: (context) => DropdownWidget(),
      //                 ));
      //           },
      //           child: Text("Text")),
      //     ),
      //     Card(
      //       color: Colors.blue,
      //       child: ElevatedButton(
      //           onPressed: () {
      //             Navigator.push(
      //                 context,
      //                 MaterialPageRoute(
      //                   builder: (context) => DropdownWidget(),
      //                 ));
      //           },
      //           child: Text("Text")),
      //     )
      //   ],
      // ),
    );
  }
}
