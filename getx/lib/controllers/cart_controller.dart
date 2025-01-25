import 'package:get/get.dart';
import 'package:getx/models/product.dart';

class CartController extends GetxController {
  double testAmount = 0;

  // List to store added products
  List<Product> cartItems = [];

  // Method to add a product to the cart
  void addToCart(Product product) {
    cartItems.add(product);
    updateTotalAmount();
  }

  // Method to calculate the total amount
  void updateTotalAmount() {
    testAmount = cartItems.fold(0, (sum, item) => sum + item.price);
    update(); // Notify GetBuilder to rebuild
  }
}
