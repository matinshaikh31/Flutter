import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/controllers/cart_controller.dart';
import 'package:getx/controllers/shopping_controller.dart';

class ShoppingPage extends StatelessWidget {
  const ShoppingPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize controllers
    final shoppingController = Get.put(ShoppingController());
    final cartController = Get.put(CartController());

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: GetBuilder<ShoppingController>(builder: (controller) {
                return ListView.builder(
                    itemCount: controller.products.length,
                    itemBuilder: (context, index) {
                      return Card(
                        margin: const EdgeInsets.all(12),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '${controller.products[index].productName}',
                                        style: const TextStyle(fontSize: 24),
                                      ),
                                      Text(
                                          '${controller.products[index].productDesc}'),
                                    ],
                                  ),
                                  Text(
                                    '\$${controller.products[index].price}',
                                    style: const TextStyle(fontSize: 24),
                                  ),
                                ],
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  cartController
                                      .addToCart(controller.products[index]);
                                },
                                child: const Text("Add to Cart"),
                              )
                            ],
                          ),
                        ),
                      );
                    });
              }),
            ),
            const Text("Total Amount:"),
            GetBuilder<CartController>(builder: (controller) {
              return Text('\$${controller.testAmount}');
            }),
            const SizedBox(
              height: 100,
            )
          ],
        ),
      ),
    );
  }
}
