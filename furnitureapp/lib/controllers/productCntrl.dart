import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:furnitureapp/models/Products.dart';
import 'package:furnitureapp/shared/firebase.dart';
import 'package:get/get.dart';

class Productcntrl extends GetxController {
  StreamSubscription<QuerySnapshot<Map<String, dynamic>>>? productsstream;
  List<Products> products = [];

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


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getProducts();

  }
}
