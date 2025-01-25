import 'package:flutter/material.dart';
import 'package:furnitureapp/shared/firebase.dart';
import 'package:get/get.dart';

class AuthCntrl extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  singup(BuildContext context) {
    try {
      FBAuth.auth.createUserWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.toString());
      FBFireStore.users.doc(FBAuth.auth.currentUser!.uid).set({
        "email": emailController.text.trim(),
        "name": nameController.text.trim(),
      });
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }
}
