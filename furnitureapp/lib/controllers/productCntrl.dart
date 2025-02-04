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
    final previousCart = Get.find<AuthCntrl>().userdetails?.cart ?? {};
    if (previousCart.containsKey(productId)) {
      previousCart.update(
        productId,
        (value) {
          return value + 1;
        },
      );
    } else {
      previousCart.addEntries([MapEntry(productId, 1)]);
    }
    await FBFireStore.users.doc(currentUserId).update({
      "cart": previousCart,
    });
  }

  removeProductFromCart(String productId) async {
    final previousCart = Get.find<AuthCntrl>().userdetails?.cart ?? {};
    previousCart.remove(productId);

    await FBFireStore.users.doc(currentUserId).update({"cart": previousCart});
    update();
  }

  updateProductQty(String productId, int qty) async {
    final previousCart = Get.find<AuthCntrl>().userdetails?.cart ?? {};

    if (qty > 0) {
      previousCart[productId] = qty;
    } else {
      previousCart.remove(productId);
    }

    await FBFireStore.users.doc(currentUserId).update({"cart": previousCart});
    update();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getProducts();
  }
}
