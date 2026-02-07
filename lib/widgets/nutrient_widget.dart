import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fruit_shop/data/data.dart';
import 'package:fruit_shop/utils/icon_widget.dart';

class NutrientWidget extends StatelessWidget {
  final Product product;
  final int index;
  const NutrientWidget({super.key, required this.product, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: boxShadow,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                product.nutrients[index][0],
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              Text(
                "${product.nutrients[index][1]}/5",
                style: TextStyle(
                  color: product.nutrientsColor,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          SizedBox(height: 5),
          Row(
            children: buildIndicator(
              product.nutrients[index][0],
              int.parse(product.nutrients[index][1]),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> buildIndicator(String nutrientType, int value) {
    List<Widget> list = [];
    for (int i = 0; i < 5; i++) {
      list.add(
        i < value
            ? indicator(true, nutrientType)
            : indicator(false, nutrientType),
      );
    }
    return list;
  }

  Widget indicator(bool isActive, String nutrientType) {
    IconData icon;
    switch (nutrientType) {
      case "Energy":
        icon = FontAwesomeIcons.bolt;
        break;
      case "Freshness":
        icon = FontAwesomeIcons.glassWater;
        break;
      case "Vitamin":
        icon = Icons.rocket_launch_rounded;
        break;
      default:
        icon = FontAwesomeIcons.fire;
        break;
    }
    return Container(
      padding: EdgeInsets.only(top: 10, bottom: 10, right: 5),
      child: Icon(
        icon,
        size: 16,
        color: isActive == true ? product.nutrientsColor : Colors.black12,
      ),
    );
  }
}
