import 'package:flutter/material.dart';
import 'package:ui/Responsive/destopk_body.dart';
import 'package:ui/Responsive/mobile_body.dart';
import 'package:ui/Responsive/responsive_layout.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
        desktopBody: DestopkBody(), mobileBody: MobileBody());
  }
}
