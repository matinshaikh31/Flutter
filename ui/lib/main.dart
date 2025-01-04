import 'package:flutter/material.dart';
import 'package:ui/Widgets/alert.dart';
import 'package:ui/Widgets/animatedText.dart';
import 'package:ui/Widgets/bottomNavigation.dart';
import 'package:ui/Widgets/bottomSheet.dart';
import 'package:ui/Widgets/button.dart';
import 'package:ui/Widgets/container_sized.dart';
import 'package:ui/Widgets/dismissable.dart';
import 'package:ui/Widgets/drawer.dart';
import 'package:ui/Widgets/dropDown.dart';
import 'package:ui/Widgets/form.dart';
import 'package:ui/Widgets/image.dart';
import 'package:ui/Widgets/imagePicker.dart';
import 'package:ui/Widgets/listViewGridView.dart';
import 'package:ui/Widgets/rowscols.dart';
import 'package:ui/Widgets/snackBar.dart';
import 'package:ui/Widgets/stack.dart';
import 'package:ui/Widgets/tabBar.dart';
import 'package:ui/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.deepPurpleAccent,
      ),
      home: Homepage(),
    );
  }
}
