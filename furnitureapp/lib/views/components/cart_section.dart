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
      final cart = Get.find<AuthCntrl>().userdetails?.cart ?? {};
      final cartItems = pcntrl.products
          .where((product) => cart.containsKey(product.id))
          .toList();

      return cartItems.isEmpty
          ? const Center(child: Text("Your cart is empty"))
          : ListView.builder(
              itemCount: cartItems.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                final product = cartItems[index];

                final int qty = cart[product.id] ?? 1;

                return Card(
                  color: Colors.blueGrey.shade200,
                  elevation: 5.0,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.network(
                          product.images.isNotEmpty
                              ? product.images
                              : "https://via.placeholder.com/80",
                          height: 80,
                          width: 80,
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(width: 20),

                        // Product Details
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _buildRichText('Name: ', product.name),
                              _buildRichText('Color: ', product.color),
                              _buildRichText(
                                  'Price: \$', product.price.toString()),
                            ],
                          ),
                        ),

                        Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                if (qty > 1) {
                                  pcntrl.updateProductQty(product.id, qty - 1);
                                } else {
                                  pcntrl.removeProductFromCart(product.id);
                                }
                              },
                              icon: const Icon(Icons.remove_circle,
                                  color: Colors.red),
                            ),
                            Text(
                              qty.toString(),
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            IconButton(
                              onPressed: () {
                                pcntrl.updateProductQty(product.id, qty + 1);
                              },
                              icon: const Icon(Icons.add_circle,
                                  color: Colors.green),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
    });
  }

  Widget _buildRichText(String label, String value) {
    return RichText(
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      text: TextSpan(
        text: label,
        style: TextStyle(color: Colors.blueGrey.shade800, fontSize: 16.0),
        children: [
          TextSpan(
            text: value,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
