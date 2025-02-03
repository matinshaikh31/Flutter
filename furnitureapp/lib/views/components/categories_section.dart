import 'package:flutter/material.dart';
import 'package:furnitureapp/controllers/productCntrl.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

List<Map<String, dynamic>> iconTextList = [
  {"icon": Icons.chair, 'text': "wood"},
  {"icon": Icons.chair, 'text': "aluminum"},
  {"icon": Icons.chair, 'text': "steel"},
  {"icon": Icons.chair, 'text': "fabric"},
];

class CategoriesSection extends StatelessWidget {
  const CategoriesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final sizeWidth = MediaQuery.sizeOf(context).width;
    return GetBuilder<Productcntrl>(builder: (pcntrl) {
      return Padding(
        padding: EdgeInsets.only(top: 25, left: sizeWidth < 600 ? 10 : 50),
        child: SizedBox(
          height: 200,
          child: Column(
            // mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Shop By Categories",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
              ),
              Text(
                  "Explore Our curated selection to elevate your living space"),
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: ListView.separated(
                    separatorBuilder: (BuildContext context, int index) =>
                        const SizedBox(
                      width: 25,
                    ),
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: iconTextList.length,
                    itemBuilder: (context, index) {
                     
                      return Column(
                        // mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.black)),
                            child: Padding(
                              padding: EdgeInsets.all(10),
                              child: Icon(
                                iconTextList[index]["icon"],
                                size: 40,
                              ),
                            ),
                          ),
                          InkWell(
                            child: Text(
                              "${iconTextList[index]["text"]}",
                            ),
                            onTap: () {
                              GoRouter.of(context).go(
                                  "/categiour/${iconTextList[index]["text"]}");
                            },
                          )
                        ],
                      );
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
