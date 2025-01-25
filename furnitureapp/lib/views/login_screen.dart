import 'package:flutter/material.dart';
import 'package:furnitureapp/views/components/navbar_mobile.dart';
import 'package:furnitureapp/views/components/navbar_section.dart';
import 'package:furnitureapp/views/home_screen.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final sizeWidth = MediaQuery.sizeOf(context).width;
    return Scaffold(
      key: scaffoldKey,
      appBar: sizeWidth < 600
          ? AppBar()
          : PreferredSize(
              preferredSize: Size.fromHeight(80),
              child: NavbarSection(),
            ),
      drawer: sizeWidth < 600 ? NavbarMobile(scakey: scaffoldKey) : null,
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            Text(
              "Login With Email",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Please login to access your saved",
              style: TextStyle(fontSize: 18),
            ),
            Text(
              " sizes of the cart items",
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: sizeWidth < 600 ? 300 : 400,
              child: TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.email),
                  hintText: "Enter Your Email",
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: sizeWidth < 600 ? 300 : 400,
              child: TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.password),
                  hintText: "Enter Your password",
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: 200,
              height: 50,
              child: TextButton(
                onPressed: () {},
                style: ButtonStyle(
                  foregroundColor: WidgetStatePropertyAll(Colors.white),
                  shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
                  backgroundColor: WidgetStatePropertyAll(Colors.black),
                ),
                child: Text("Sumbit"),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text("Don`t have account?"),
            InkWell(
              onTap: () => GoRouter.of(context).go("/register"),
              child: Text(
                "Register",
                style: TextStyle(color: Colors.blue),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
