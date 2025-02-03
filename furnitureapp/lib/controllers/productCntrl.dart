import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:furnitureapp/controllers/auth_cntrl.dart';
import 'package:furnitureapp/models/Products.dart';
import 'package:furnitureapp/shared/firebase.dart';
import 'package:get/get.dart';

class Productcntrl extends GetxController {
  StreamSubscription<QuerySnapshot<Map<String, dynamic>>>? productsstream;
  List<Products> products = [];
  // Map<String, String> cart = {"id": "", "count": ""};

  final currentUserId = FBAuth.auth.currentUser?.uid;

  getProducts() {
    productsstream?.cancel();
    productsstream = FBFireStore.products.snapshots().listen(
      (event) {
        // print('event.size: ${event.size}');
        products = event.docs.map((e) => Products.fromSnap(e)).toList();
        update();
      },
    );
  }

  Future<void> addProductToCart(String productId) async {
    final userId = FBAuth.auth.currentUser?.uid;
    if (userId == null) return;

    final userRef = FirebaseFirestore.instance.collection('Users').doc(userId);

    try {
      final userDoc = await userRef.get();
      List<dynamic> cart = [];

      if (userDoc.exists) {
        cart = userDoc.data()?["cart"] ?? [];
      }

      bool productExists = false;

      for (var item in cart) {
        if (item["id"] == productId) {
          item["count"] = (item["count"] ?? 0) + 1;
          productExists = true;
          break;
        }
      }

      if (!productExists) {
        cart.add({"id": productId, "count": 1});
      }

      await userRef.set({
        "cart": cart,
      }, SetOptions(merge: true));
    } catch (e) {
      print("Error adding to cart: $e");
    }
  }

  removeProductFromCart(String productId) async {
    final userRef = FBFireStore.users.doc(currentUserId);

    final userDoc = await userRef.get();
    if (!userDoc.exists) return;

    final userData = userDoc.data() as Map<String, dynamic>;
    List cart = List.from(userData['cart'] ?? []);

    final cartItemIndex = cart.indexWhere((item) => item['id'] == productId);
    if (cartItemIndex == -1) return; // Item not found

    final int currentQty = cart[cartItemIndex]['qty'] ?? 1;

    if (currentQty > 1) {
      cart[cartItemIndex]['qty'] = currentQty - 1;
    } else {
      cart.removeAt(cartItemIndex);
    }

    await userRef.update({
      "cart": cart,
    });
  }

  @override
  void onInit() { 
    // TODO: implement onInit
    super.onInit();
    getProducts();
  }
}
