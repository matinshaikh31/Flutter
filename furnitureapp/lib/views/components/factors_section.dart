import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class FactorsSection extends StatelessWidget {
  const FactorsSection({super.key});

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
                "Factory Setting Us Apart",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
              ),
              Text(
                  "Explore Our curated selection to elevate your living space"),
              SizedBox(
                height: 10,
              ),
              StaggeredGrid.extent(
                maxCrossAxisExtent: sizeWidth < 600 ? 200 : 400,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                children: [
                  Column(
                    spacing: 10,
                    children: [
                      Icon(
                        Icons.card_giftcard,
                        size: 50,
                      ),
                      Text(
                        "Exclusive Design",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text("Elevating Luxvary Living with unique creation")
                    ],
                  ),
                  Column(
                    spacing: 10,
                    children: [
                      Icon(
                        Icons.rocket_launch_outlined,
                        size: 50,
                      ),
                      Text("Exclusive Design",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Text("Elevating Luxvary Living with unique creation")
                    ],
                  ),
                  Column(
                    spacing: 10,
                    children: [
                      Icon(
                        Icons.lock_clock_outlined,
                        size: 50,
                      ),
                      Text("Exclusive Design",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Text("Elevating Luxvary Living with unique creation")
                    ],
                  ),
                  Column(
                    spacing: 10,
                    children: [
                      Icon(
                        Icons.diamond_outlined,
                        size: 50,
                      ),
                      Text("Exclusive Design",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Center(
                          child: Text(
                              "Elevating Luxvary Living with unique creation"))
                    ],
                  ),
                ],
              )
            ])));
  }
}
