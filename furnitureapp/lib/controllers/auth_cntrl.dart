import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:furnitureapp/shared/firebase.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class AuthCntrl extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  singup(BuildContext context) async {
    try {
      await FBAuth.auth
          .createUserWithEmailAndPassword(
              email: emailController.text.trim(),
              password: passwordController.text.toString().trim())
          .then((e) {
        Fluttertoast.showToast(
            msg: "Succes Fully",
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 2,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0);
        FBFireStore.users.doc(FBAuth.auth.currentUser?.uid).set({
          "uid": FBAuth.auth.currentUser?.uid,
          "email": emailController.text.trim(),
          "name": nameController.text.trim(),
        });
        context.go("/login");
      }).onError((error, StackTrace) {
        Fluttertoast.showToast(
            msg: error.toString(),
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 2,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      });
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  singin(BuildContext context) async {
    try {
      await FBAuth.auth
          .signInWithEmailAndPassword(
              email: emailController.text.trim(),
              password: passwordController.text.trim())
          .then((e) {
        Fluttertoast.showToast(
            msg: "SuccesFully",
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 2,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0);

        context.go("/");
      }).onError((error, StackTrace) {
        Fluttertoast.showToast(
            msg: error.toString(),
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 2,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      });
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  logout() async {
    await FBAuth.auth.signOut().then((value) {
      Fluttertoast.showToast(
          msg: "Logout",
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 2,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }).onError((err, StackTrace) {
      Fluttertoast.showToast(
          msg: err.toString(),
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 2,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    });
  }

  getCurrentUser()  {
    return FBAuth.auth.currentUser;
    print("ammmmmmmmmmmmmmmmmmmmmmm${FBAuth.auth.currentUser}");
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getCurrentUser();
  }
}
