import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fruit_shop/data/data.dart';
import 'package:fruit_shop/utils/colors.dart';
import 'package:fruit_shop/utils/icon_widget.dart';
import 'package:fruit_shop/widgets/nutrient_widget.dart';

class DetailsScreen extends StatefulWidget {
  final Product product;
  const DetailsScreen({super.key, required this.product});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  int itemCount = 1;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: size.height * 0.50,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            color: widget.product.color,
            child: Transform.rotate(
              angle: 2.10 * pi,
              child: Image.asset(widget.product.image),
            ),
          ),
          Positioned(
            top: 45,
            right: 20,
            left: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  child: iconWidget(FontAwesomeIcons.arrowLeft, false),
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                ),
                Text(
                  "Details",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                InkWell(child: iconWidget(FontAwesomeIcons.bagShopping, false)),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: size.height * 0.55),
            child: SingleChildScrollView(
              padding: EdgeInsets.all(20),
              child: SizedBox(
                height: size.height * 0.55,
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Products Details
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.product.name,
                              style: TextStyle(
                                fontSize: 35,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(height: 10),
                            priceWidget(widget.product.price),
                          ],
                        ),
                        Container(
                          width: 130,
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30),
                            boxShadow: boxShadow,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              quantityIcon(
                                onTap: () {
                                  if(itemCount>0){
                                    setState(() {
                                      itemCount--;
                                    });
                                  }
                                },
                                color: FsColors.secondary,
                                icon: FontAwesomeIcons.minus,
                              ),
                              Text(
                                itemCount.toString(),
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              quantityIcon(
                                onTap: () {
                                  setState(() {
                                    itemCount++;
                                  });
                                },
                                color: FsColors.primary,
                                icon: FontAwesomeIcons.plus,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    // Nutrients Details
                    GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 1.6,
                      ),
                      itemCount: widget.product.nutrients.length,
                      shrinkWrap: true,
                      primary: false,
                      itemBuilder: (context, index) {
                        return NutrientWidget(
                          product: data[0].products![index],
                          index: index,
                        );
                      },
                    ),
                    Padding(
                      padding: EdgeInsets.all(8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Details",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 10,),
                          Text("Fresh & Juicy Fruits – Handpicked for great taste and nutrition, perfect for snacking, juices, and healthy meals.")
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget quantityIcon({
  required VoidCallback onTap,
  required Color color,
  required IconData icon,
}) {
  return InkWell(
    onTap: onTap,
    child: Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(shape: BoxShape.circle, color: color),
      child: Icon(
        icon,
        color: color == FsColors.primary ? Colors.white : FsColors.primary,
        size: 20,
      ),
    ),
  );
}
