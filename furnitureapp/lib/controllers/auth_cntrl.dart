import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:furnitureapp/models/user_model.dart';
import 'package:furnitureapp/shared/firebase.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class AuthCntrl extends GetxController {
  StreamSubscription<DocumentSnapshot<Map<String, dynamic>>>? userDetailsStream;
  StreamSubscription<User?>? authStream;
  UserModel? userdetails;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();

  authStateListner() async {
    // print("NNANANANA");
    try {
      authStream?.cancel();
      authStream = FBAuth.auth.authStateChanges().listen((event) {
        // print("###########${event?.uid}");
        currentUserListner(event?.uid);
      });
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  currentUserListner(String? userId) {
    try {
      userDetailsStream?.cancel();
      userDetailsStream =
          FBFireStore.users.doc(userId).snapshots().listen((event) {
        // print('-------- ${event.data()}');
        userdetails = UserModel.fromSnap(event);
        // print("matin${userdetails}");
        update();
      });
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  singup(BuildContext context) {
    try {
      FBAuth.auth
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

  singin(BuildContext context) {
    try {
      FBAuth.auth
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

  logout(BuildContext context) {
    FBAuth.auth.signOut().then((value) {
      Fluttertoast.showToast(
          msg: "Logout",
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 2,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      context.go("/");
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

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    authStateListner();
  }
}
