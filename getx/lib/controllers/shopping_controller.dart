import 'package:get/get.dart';
import 'package:getx/models/product.dart';

class ShoppingController extends GetxController {
  List<Product> products = <Product>[];

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchProducts();
  }

  fetchProducts() async {
    await Future.delayed(Duration(milliseconds: 1));
    products = [
      Product(
          id: 1,
          price: 30,
          productDesc: 'some description about product',
          productImg: 'abd',
          productName: 'FirstProd'),
      Product(
          id: 2,
          price: 40,
          productDesc: 'some description about product',
          productImg: 'abd',
          productName: 'SecProd'),
      Product(
          id: 3,
          price: 49.5,
          productDesc: 'some description about product',
          productImg: 'abd',
          productName: 'ThirdProd'),
    ];
    update();
  }
}
