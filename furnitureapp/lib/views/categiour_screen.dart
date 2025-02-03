import 'package:flutter/material.dart';
import 'package:furnitureapp/controllers/productCntrl.dart';
import 'package:furnitureapp/views/components/products_section.dart';
import 'package:get/get.dart';

class CategiourScreen extends StatefulWidget {
  final String type;
  const CategiourScreen({required this.type, super.key});

  @override
  State<CategiourScreen> createState() => _CategiourScreenState();
}

class _CategiourScreenState extends State<CategiourScreen> {
  @override
  Widget build(BuildContext context) {
    print(widget.type);
    return Scaffold(
      body: GetBuilder<Productcntrl>(builder: (pcntrl) {
        final productBycategor = pcntrl.products
            .where((element) => element.category == widget.type)
            .toList();
        print(productBycategor.map(
          (e) => e.id,
        ));
        return Center(
          child: Column(
            // mainAxisSize: MainAxisSize.min,

            children: [
              Text("${widget.type} Categiours Products"),
              Text(productBycategor.length.toString()),
              ListView.builder(
                itemCount: productBycategor.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return ProductCard(
                    id: productBycategor[index].id,
                    productName: productBycategor[index].category,
                    productImg: productBycategor[index].images,
                    productPrice: productBycategor[index].price,
                  );
                },
              )
            ],
          ),
        );
      }),
    );
  }
}
