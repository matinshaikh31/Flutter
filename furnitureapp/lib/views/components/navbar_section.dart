import 'package:flutter/material.dart';
import 'package:furnitureapp/controllers/auth_cntrl.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:go_router/go_router.dart';

class NavbarSection extends StatelessWidget implements PreferredSizeWidget {
  NavbarSection({
    super.key,
  });

  // final authCntrl = Get.find<AuthCntrl>();
  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: Colors.white70,
      title: Wrap(children: [
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Center(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              spacing: 10,
              children: [
                Row(
                  spacing: 15,
                  children: [
                    TextButton(
                      onPressed: () => GoRouter.of(context).go("/"),
                      child: Text("Home   |", style: TextStyle(fontSize: 18)),
                    ),
                    TextButton(
                      onPressed: () => GoRouter.of(context).go("/products"),
                      child:
                          Text("Products   |", style: TextStyle(fontSize: 18)),
                    ),
                    Text(
                      "Categirous",
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 100),
                  child: Text(
                    "FURNITURE APP",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                Wrap(children: [
                  GetBuilder<AuthCntrl>(builder: (authcntrl) {
                    return Row(
                      spacing: 20,
                      children: [
                        Icon(Icons.search),
                        Badge(
                          label: Text(
                              authcntrl.userdetails?.cart.length.toString() ??
                                  "0"),
                          child: Icon(Icons.shopping_bag_outlined),
                        ),
                        InkWell(
                            onTap: () => authcntrl.userdetails != null
                                ? GoRouter.of(context).go("/profile")
                                : GoRouter.of(context).go("/login"),
                            child: Icon(Icons.person_2_outlined)),
                      ],
                    );
                  }),
                ])
              ],
            ),
          ),
        ),
      ]),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => throw UnimplementedError();
}
