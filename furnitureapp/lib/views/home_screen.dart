import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:furnitureapp/views/Responsive_layout.dart';
// import 'package:furnitureapp/views/widgets/categories/categories_icons.dart';
import 'package:furnitureapp/views/components/categories_section.dart';
import 'package:furnitureapp/views/components/factors_section.dart';
import 'package:furnitureapp/views/components/hero_section.dart';
import 'package:furnitureapp/views/components/navbar_mobile.dart';
import 'package:furnitureapp/views/components/navbar_section.dart';
import 'package:furnitureapp/views/components/product_gallery_section.dart';
import 'package:furnitureapp/views/components/products_section.dart';

GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      desktopBody: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(80),
            child: NavbarSection(),
          ),
          body: SingleChildScrollView(
            child: Center(
              child: Container(
                padding: const EdgeInsets.all(10),
                constraints: BoxConstraints(maxWidth: 1400),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    HeroSection(),
                    CategoriesSection(),
                    ProductsSection(),
                    ProductGallerySection(),
                    FactorsSection()
                  ],
                ),
              ),
            ),
          )),
      mobileBody: Scaffold(
        key: scaffoldKey,
        appBar: AppBar(),
        drawer: NavbarMobile(
          scakey: scaffoldKey,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              HeroSection(),
              CategoriesSection(),
              ProductsSection(),
              ProductGallerySection(),
              FactorsSection()
            ],
          ),
        ),
      ),
    );
  }
}
