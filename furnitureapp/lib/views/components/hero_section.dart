import 'package:flutter/material.dart';

class HeroSection extends StatefulWidget {
  const HeroSection({super.key});

  @override
  State<HeroSection> createState() => _HeroSectionState();
}

class _HeroSectionState extends State<HeroSection> {
  @override
  Widget build(BuildContext context) {
    final sizeWidth = MediaQuery.sizeOf(context).width;
    return Padding(
      padding: EdgeInsets.all(sizeWidth < 600 ? 10 : 0),
      child: Container(
        height: 600,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
              image: AssetImage("assets/sofa2.jpg"),
              fit: BoxFit.cover,
            )),
        child: Stack(
          children: [
            Container(
              // color: Colors.black,
              child: Padding(
                padding: EdgeInsets.only(left: sizeWidth < 600 ? 10 : 100),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Sofa Grace",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      // color: Colors.red,
                      width: 280,
                      child: Text(
                        "Score new arrivals from the latest items multipurpose ecommerce templet ready ",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 35,
                    ),
                    Row(
                      spacing: 4,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.yellow)),
                          child: TextButton(
                              onPressed: () {},
                              child: Text(
                                "Shop Now",
                                style: TextStyle(color: Colors.yellow),
                              )),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.white)),
                          child: TextButton(
                              onPressed: () {},
                              child: Text(
                                "Contact Us",
                                style: TextStyle(color: Colors.white),
                              )),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      "India's no. 1",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Luxury Furniture Store",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                      ),
                    ),
                    Text(
                      "product price with discount is avaliable until the end of stock",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
