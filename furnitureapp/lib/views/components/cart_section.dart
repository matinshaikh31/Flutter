import 'package:flutter/material.dart';
import 'package:furnitureapp/controllers/auth_cntrl.dart';
import 'package:furnitureapp/controllers/productCntrl.dart';
import 'package:get/get.dart';

class CartSection extends StatefulWidget {
  const CartSection({super.key});

  @override
  State<CartSection> createState() => _CartSectionState();
}

class _CartSectionState extends State<CartSection> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<Productcntrl>(builder: (pcntrl) {
      final cartItems = pcntrl.products.where((element) {
        return Get.find<AuthCntrl>()
                .userdetails
                ?.cart
                .any((cartItem) => cartItem['id'] == element.id) ??
            false;
      }).toList();

      return ListView.builder(
        itemCount: cartItems.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          final product = cartItems[index];

          // Get the quantity from the cart
          final cartItem = Get.find<AuthCntrl>().userdetails?.cart.firstWhere(
                (item) => item['id'] == product.id,
              );
          final int qty = cartItem != null ? cartItem['count'] ?? 1 : 1;

          return Card(
            color: Colors.blueGrey.shade200,
            elevation: 5.0,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Product Image
                  Image(
                    height: 80,
                    width: 80,
                    fit: BoxFit.cover,
                    image: NetworkImage(product.images.isNotEmpty
                        ? product.images
                        : "https://via.placeholder.com/80"), // Default image
                  ),
                  const SizedBox(width: 20),

                  // Product Details
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          text: TextSpan(
                              text: 'Name: ',
                              style: TextStyle(
                                  color: Colors.blueGrey.shade800,
                                  fontSize: 16.0),
                              children: [
                                TextSpan(
                                    text: '${product.name}\n',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold)),
                              ]),
                        ),
                        RichText(
                          maxLines: 1,
                          text: TextSpan(
                              text: 'Color: ',
                              style: TextStyle(
                                  color: Colors.blueGrey.shade800,
                                  fontSize: 16.0),
                              children: [
                                TextSpan(
                                    text: '${product.color}\n',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold)),
                              ]),
                        ),
                        RichText(
                          maxLines: 1,
                          text: TextSpan(
                              text: 'Price: ' r"$",
                              style: TextStyle(
                                  color: Colors.blueGrey.shade800,
                                  fontSize: 16.0),
                              children: [
                                TextSpan(
                                    text: '${product.price}\n',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold)),
                              ]),
                        ),
                        RichText(
                          maxLines: 1,
                          text: TextSpan(
                              text: 'Qty: ',
                              style: TextStyle(
                                  color: Colors.blueGrey.shade800,
                                  fontSize: 16.0),
                              children: [
                                TextSpan(
                                    text: '$qty\n',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold)),
                              ]),
                        ),
                      ],
                    ),
                  ),

                  // Delete Button
                  IconButton(
                    onPressed: () {
                      pcntrl.removeProductFromCart(product.id);
                    },
                    icon: Icon(Icons.delete, color: Colors.red),
                  ),
                ],
              ),
            ),
          );
        },
      );
    });
  }
}
