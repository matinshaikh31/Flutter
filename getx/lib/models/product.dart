class Product {
  final int id;
  final String productName;
  final String? productImg;
  final String? productDesc;
  final double price;

  Product({
    required this.id,
    required this.productName,
    this.productImg,
    this.productDesc,
    required this.price,
  });
}
