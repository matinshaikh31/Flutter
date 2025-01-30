import 'package:flutter/material.dart';
import 'package:furnitureapp/controllers/auth_cntrl.dart';
import 'package:furnitureapp/views/components/navbar_section.dart';
import 'package:furnitureapp/views/home_screen.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

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
        return Container(
          width: 400,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black12),
              borderRadius: BorderRadius.circular(23)),
          child: Row(
            children: [
              Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.person,
                    size: 60,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text("Name: Matin"),
                  SizedBox(
                    height: 10,
                  ),
                  Text("Email: matinshaikh@gmail.com"),
                  SizedBox(
                    height: 10,
                  ),
                  TextButton(
                      onPressed: () {
                        Get.find<AuthCntrl>().logout();
                      },
                      child: Text("Logout"))
                ],
              ),
            ],
          ),
        );
      }),
    );
  }
}
