import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:furnitureapp/controllers/auth_cntrl.dart';
import 'package:furnitureapp/views/components/cart_section.dart';
import 'package:furnitureapp/views/components/navbar_section.dart';
import 'package:furnitureapp/views/home_screen.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final sizeWidth = MediaQuery.sizeOf(context).width;
    return Scaffold(
      key: scaffoldKey,
      appBar: sizeWidth < 600
          ? AppBar()
          : PreferredSize(
              preferredSize: Size.fromHeight(80), child: NavbarSection()),
      body: GetBuilder<AuthCntrl>(builder: (authcntrl) {
        final userdetails = authcntrl.userdetails;
        print("nameofuser${userdetails?.name}");
        return StaggeredGrid.count(
          crossAxisCount: 2,
          mainAxisSpacing: 2,
          crossAxisSpacing: 4,
          children: [
            StaggeredGridTile.count(
              crossAxisCellCount: 1,
              mainAxisCellCount: 4,
              child: Container(
                decoration: BoxDecoration(color: Colors.blueGrey.shade800),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.person,
                      size: 60,
                      color: Colors.white,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text("Name: ${userdetails?.name}",
                        style: TextStyle(color: Colors.white)),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Email: ${userdetails?.email}",
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    IconButton(onPressed: () {}, icon: Icon(Icons.logout))
                  ],
                ),
              ),
            ),
            StaggeredGridTile.count(
              crossAxisCellCount: 1,
              mainAxisCellCount: 4,
              child: Column(
                children: [
                  Text(
                    "Your Cart",
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                  ),
                  CartSection(),
                  TextButton(
                      onPressed: () {
                        Get.find<AuthCntrl>().logout(context);
                      },
                      child: Text("Logout"))
                ],
              ),
            ),
          ],
        );
        // Row(
        //   children: [
        //     Column(
        //       children: [
        //         Icon(
        //           Icons.person,
        //           size: 60,
        //         ),
        //         SizedBox(
        //           height: 10,
        //         ),
        //         Text("Name: ${userdetails?.name}"),
        //         SizedBox(
        //           height: 10,
        //         ),
        //         Text("Email: ${userdetails?.email}"),
        //         SizedBox(
        //           height: 10,
        //         ),
        //         TextButton(
        //             onPressed: () {
        //               authcntrl.logout(context);
        //             },
        //             child: Text("Logout"))
        //       ],
        //     ),
        //     CartSection()
        //   ],
      }),
    );
  }
}
