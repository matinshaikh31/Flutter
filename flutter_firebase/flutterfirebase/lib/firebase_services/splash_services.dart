import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutterfirebase/ui/auth/login_screen.dart';
import 'package:flutterfirebase/ui/firestore/firestore_list_screen.dart';
import 'package:flutterfirebase/ui/post/post_screen.dart';
import 'package:flutterfirebase/ui/post/upload_image.dart';

class SplashServices {
  void isLogin(BuildContext context) {
    FirebaseAuth _auth = FirebaseAuth.instance;
    final user = _auth.currentUser;

    if (user != null) {
      Timer(const Duration(seconds: 3), () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => UploadImage()));
      });
    } else {
      Timer(const Duration(seconds: 3), () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => LoginScreen()));
      });
    }
  }
}
