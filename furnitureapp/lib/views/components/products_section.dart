import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:furnitureapp/controllers/productCntrl.dart';
import 'package:furnitureapp/models/Products.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class ProductsSection extends StatefulWidget {
  const ProductsSection({super.key});

  @override
  State<ProductsSection> createState() => _ProductsSectionState();
}

class _ProductsSectionState extends State<ProductsSection> {
  @override
  Widget build(BuildContext context) {
    final sizeWidth = MediaQuery.sizeOf(context).width;
    return GetBuilder<Productcntrl>(
      builder: (pCtrl) {
        print(pCtrl.products.length);
        final allproductsList = pCtrl.products;
        // print("object======");
        return Padding(
          padding: EdgeInsets.only(left: sizeWidth < 600 ? 10 : 50),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Discover All Products",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
                ),
                Text(
                    "Explore Our curated selection to elevate your living space"),
                SizedBox(
                  height: 10,
                ),
                ProductStaggeredGrid(allproducts: allproductsList)
              ],
            ),
          ),
        );
      },
    );
  }
}

class ProductStaggeredGrid extends StatelessWidget {
  const ProductStaggeredGrid({
    super.key,
    required this.allproducts,
  });

  final List<Products> allproducts;

  @override
  Widget build(BuildContext context) {
    return StaggeredGrid.extent(
      maxCrossAxisExtent: 400,
      crossAxisSpacing: 50,
      mainAxisSpacing: 10,
      // crossAxisCount: sizeWidth < 600 ? 1 : 3,
      children: [
        ...List.generate(
          allproducts.length,
          (index) {
            final product = allproducts[index];
            final id = product.id;
            return ProductCard(
                id: id,
                productName: product.name,
                productImg: product.images,
                productPrice: product.price);
          },
        )
      ],
    );
  }
}

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.id,
    required this.productName,
    required this.productImg,
    required this.productPrice,
  });

  final String id;
  final String productName;
  final String productImg;
  final String productPrice;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Handle the tap event if needed
      },
      child: SizedBox(
        height: 350,
        child: InkWell(
          onTap: () {
            GoRouter.of(context).go("/products/$id");
          },
          child: Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
                  child: Image.network(
                    productImg,
                    fit: BoxFit.cover,
                    height: 250,
                    width: double.infinity,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        productName,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        '\$$productPrice', // Assuming price is a number
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[700],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
