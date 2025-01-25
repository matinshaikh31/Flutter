import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class ProductGallerySection extends StatelessWidget {
  const ProductGallerySection({super.key});

  @override
  Widget build(BuildContext context) {
    final sizeWidth = MediaQuery.sizeOf(context).width;
    return Padding(
      padding: EdgeInsets.only(top: 25, left: sizeWidth < 600 ? 10 : 50),
      child: Container(
        child: Column(
          // mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Product Gallery",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
            ),
            Text("Explore Our curated selection to elevate your living space"),
            SizedBox(
              height: 10,
            ),
            StaggeredGrid.count(
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
              crossAxisCount: 3,
              children: [
                StaggeredGridTile.count(
                  crossAxisCellCount: 2,
                  mainAxisCellCount: 1,
                  child: Image.asset(
                    "assets/p1.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
                StaggeredGridTile.count(
                  crossAxisCellCount: 1,
                  mainAxisCellCount: 1,
                  child: Image.asset(
                    "assets/p2.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
                StaggeredGridTile.count(
                  crossAxisCellCount: 1,
                  mainAxisCellCount: 1,
                  child: Image.asset(
                    "assets/p3.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
                StaggeredGridTile.count(
                  crossAxisCellCount: 1,
                  mainAxisCellCount: 1,
                  child: Image.asset(
                    "assets/p4.jfif",
                    fit: BoxFit.cover,
                  ),
                ),
                StaggeredGridTile.count(
                  crossAxisCellCount: 1,
                  mainAxisCellCount: 1,
                  child: Image.asset(
                    "assets/p5.jfif",
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
