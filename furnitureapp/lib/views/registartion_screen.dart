import 'package:flutter/material.dart';
import 'package:furnitureapp/controllers/auth_cntrl.dart';
import 'package:furnitureapp/models/user_model.dart';
import 'package:furnitureapp/views/components/navbar_mobile.dart';
import 'package:furnitureapp/views/components/navbar_section.dart';
import 'package:furnitureapp/views/home_screen.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class RegistartionScreen extends StatefulWidget {
  const RegistartionScreen({super.key});

  @override
  State<RegistartionScreen> createState() => _RegistartionScreenState();
}

class _RegistartionScreenState extends State<RegistartionScreen> {
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
      body: GetBuilder<AuthCntrl>(builder: (authcntrl) {
        return Center(
          child: Column(
            children: [
              SizedBox(
                height: 40,
              ),
              Text(
                "Registration",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Regsitartion as a new user",
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: sizeWidth < 600 ? 300 : 400,
                child: TextFormField(
                  controller: authcntrl.nameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.person),
                    hintText: "Enter Your Name",
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: sizeWidth < 600 ? 300 : 400,
                child: TextFormField(
                  controller: authcntrl.emailController,
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
                  controller: authcntrl.passwordController,
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
                  child: Text("Register"),
                ),
              )
            ],
          ),
        );
      }),
    );
  }
}
