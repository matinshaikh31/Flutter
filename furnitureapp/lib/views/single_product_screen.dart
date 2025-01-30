// ignore_for_file: deprecated_member_use

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:furnitureapp/controllers/productCntrl.dart';
import 'package:furnitureapp/models/Products.dart';
import 'package:furnitureapp/shared/firebase.dart';
import 'package:furnitureapp/views/Responsive_layout.dart';
import 'package:furnitureapp/views/components/navbar_mobile.dart';
import 'package:furnitureapp/views/components/navbar_section.dart';
import 'package:furnitureapp/views/home_screen.dart';
import 'package:get/get.dart';

class SingleProductScreen extends StatefulWidget {
  final String id;
  final prod = Productcntrl().productsstream;

  SingleProductScreen({required this.id, super.key});

  @override
  State<SingleProductScreen> createState() => _SingleProductScreenState();
}

class _SingleProductScreenState extends State<SingleProductScreen> {
  @override
  Widget build(BuildContext context) {
    print(widget.id);
    return GetBuilder<Productcntrl>(builder: (pcntrl) {
      final product = pcntrl.products.firstWhereOrNull(
        (element) => element.id == widget.id,
      );
      return ResponsiveLayout(
          desktopBody: Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(80),
              child: NavbarSection(),
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      SizedBox(width: 10),
                      SizedBox(
                          width: 700,
                          height: 600,
                          child: Padding(
                            padding: const EdgeInsets.all(30),
                            child: SingleProductImages(product: product),
                          )),
                      _productDetails(product, pcntrl)
                    ],
                  )
                ],
              ),
            ),
          ),
          mobileBody: Scaffold(
            appBar: AppBar(),
            key: scaffoldKey,
            drawer: NavbarMobile(scakey: scaffoldKey),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(width: 10),
                  SingleProductImages(product: product),
                  _productDetails(product, pcntrl)
                ],
              ),
            ),
          ));
    });
    //Container(
    //   child: Text("<MMAMMAM${widget.id}"),
  }

  SizedBox _productDetails(Products? product, Productcntrl pcntrl) {
    return SizedBox(
      width: 600,
      height: 600,
      child: Padding(
        padding: const EdgeInsets.all(50),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              product!.name.toString(),
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
            Text(
              "₹ ${product!.price.toString()}",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text("inclusive of all taxes"),
            SizedBox(
              height: 15,
            ),
            Text(
              product!.description.toString().toUpperCase(),
              style: TextStyle(
                fontSize: 15,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "Variant : ${product!.material.toString().toUpperCase()}",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: 125,
              height: 40,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                    color: Colors.black,
                  )),
              child: Center(
                child: Text(
                  product.color.toUpperCase(),
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              width: 400,
              height: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: const Color.fromARGB(255, 143, 107, 0)),
              child: Center(
                child: InkWell(
                  onTap: () {
                    pcntrl.addProductToCart(product.id);
                  },
                  child: Text(
                    "ADD TO CART",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "Product Code : ${product!.availability.toString().toUpperCase()}",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

class SingleProductImages extends StatelessWidget {
  const SingleProductImages({
    super.key,
    required this.product,
  });

  final Products? product;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Image.network(
        product?.images ?? "",
        fit: BoxFit.cover,
      ),
    );
  }
}
