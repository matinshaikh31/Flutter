import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavbarMobile extends StatefulWidget {
  final GlobalKey<ScaffoldState> scakey;
  const NavbarMobile({
    required this.scakey,
    super.key,
  });

  @override
  State<NavbarMobile> createState() => _NavbarMobileState();
}

class _NavbarMobileState extends State<NavbarMobile> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
          color: Colors.black,
          child: ListView(children: [
            Row(
              children: [
                Spacer(),
                IconButton(
                    onPressed: () {
                      widget.scakey.currentState!.closeDrawer();
                    },
                    icon: Icon(CupertinoIcons.xmark))
              ],
            ),
            ListTile(
              title: Text(
                "SHOP NOW",
                style: TextStyle(color: Colors.white),
              ),
            ),
            ListTile(
              title: Text(
                "CUSTOMER SERVICES",
                style: TextStyle(color: Colors.white),
              ),
            ),
            ListTile(
              title: Text(
                "OUR STORY",
                style: TextStyle(color: Colors.white),
              ),
            ),
            Divider(
              height: 10,
            ),
            ListTile(
              title: Text(
                "SIGIN/REGISTRATION",
                style: TextStyle(color: Colors.white),
              ),
            ),
            ListTile(
              title: Text(
                "TRACK ORDER",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ])),
    );
  }
}
