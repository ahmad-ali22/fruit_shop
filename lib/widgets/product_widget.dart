import 'dart:math';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fruit_shop/data/data.dart';
import 'package:fruit_shop/providers/favorite_provider.dart';
import 'package:fruit_shop/utils/colors.dart';
import 'package:fruit_shop/utils/icon_widget.dart';
import 'package:provider/provider.dart';

import '../screens/details_screen.dart';

class ProductWidget extends StatefulWidget {
  final Product product;
  const ProductWidget({super.key, required this.product});

  @override
  State<ProductWidget> createState() => _ProductWidgetState();
}

class _ProductWidgetState extends State<ProductWidget> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<FavoriteProvider>(context, listen: true);
    return Container(
      color: widget.product.color,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Transform.rotate(
              angle: 2.05 * pi,
              child: Image.asset(widget.product.image, height: 80),
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: Container(
              height: 30,
              width: 30,
              margin: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: boxShadow,
              ),
              child: GestureDetector(
                child: Icon(
                  provider.isExist(widget.product)?
                  FontAwesomeIcons.solidHeart
                  : FontAwesomeIcons.heart,
                  size: 17,
                ),
                behavior: HitTestBehavior.opaque,
                onTap: (){
                  provider.toggleFavorites(widget.product);
                  setState(() {
                  });
                },
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Container(
              height: 100,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    spreadRadius: 2,
                    blurRadius: 2,
                    color: widget.product.color.withValues(alpha: 0.5),
                    offset: Offset(0, 1),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.product.name,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 5,),
                  priceWidget(widget.product.price),
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      Text("See More", style: TextStyle(color: Colors.black54, fontWeight: FontWeight.bold),),
                      SizedBox(width: 10,),
                      Icon(FontAwesomeIcons.arrowTrendUp, color: FsColors.primary, size: 16,)
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
