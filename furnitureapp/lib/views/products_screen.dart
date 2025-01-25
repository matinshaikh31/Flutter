import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:furnitureapp/controllers/productCntrl.dart';
import 'package:furnitureapp/views/components/navbar_mobile.dart';
import 'package:furnitureapp/views/components/navbar_section.dart';
import 'package:furnitureapp/views/components/products_section.dart';
import 'package:furnitureapp/views/home_screen.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class ProductsScreen extends StatefulWidget {
  ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  final searchCntrl = TextEditingController();
  GlobalKey<ScaffoldState> skey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    final sizeWidth = MediaQuery.sizeOf(context).width;
    return Scaffold(
      key: skey,
      appBar: sizeWidth < 600
          ? AppBar()
          : PreferredSize(
              preferredSize: Size.fromHeight(80),
              child: sizeWidth < 600
                  ? Container(
                      child:
                          IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
                    )
                  : NavbarSection(),
            ),
      drawer: sizeWidth < 600 ? NavbarMobile(scakey: skey) : null,
      backgroundColor: const Color(0xfff1f1f1),
      body: GetBuilder<Productcntrl>(builder: (pcntrl) {
        final allProducst = pcntrl.products;
        final filterProducts = searchCntrl.text.isEmpty
            ? allProducst
            : allProducst
                .where(
                  (element) => element.name
                      .toLowerCase()
                      .contains(searchCntrl.text.toLowerCase()),
                )
                .toList();
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 50,
              children: [
                Center(
                  child: SizedBox(
                      width: 350,
                      child: TextFormField(
                          controller: searchCntrl,
                          onChanged: (value) => setState(() {}),
                          decoration: InputDecoration(
                            icon: Icon(Icons.search),
                            hintText: "Search a product",
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide.none,
                            ),
                          ))),
                ),
                Text(
                  "${allProducst.length.toString()}  PRODUCT FOUND",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                ProductStaggeredGrid(allproducts: filterProducts),
              ],
            ),
          ),
        );
      }),
    );
  }
}
