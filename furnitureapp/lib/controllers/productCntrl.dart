import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:furnitureapp/models/Products.dart';
import 'package:furnitureapp/shared/firebase.dart';
import 'package:get/get.dart';

class Productcntrl extends GetxController {
  StreamSubscription<QuerySnapshot<Map<String, dynamic>>>? productsstream;
  List<Products> products = [];
  List<Products> Cartproducts = [];
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

  addProductToCart(id) async {
    await FBFireStore.users.doc(currentUserId).update({
      "cart": FieldValue.arrayUnion([id])
    });
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getProducts();
  }
}
