import 'package:flutter/material.dart';
import 'package:fruit_shop/utils/colors.dart';

final boxShadow = [
  BoxShadow(
    color: Colors.black.withValues(alpha: 0.01),
    blurRadius: 1,
    spreadRadius: 1,
    offset: Offset(1, 1),
  ),
];

Widget iconWidget(IconData icon, bool dotExist) {
  return Container(
    height: 55,
    width: 55,
    decoration: BoxDecoration(
      color: Colors.white,
      shape: BoxShape.circle,
      boxShadow: boxShadow,
    ),
    child: Stack(
      alignment: Alignment.center,
      children: [
        Icon(icon, size: 28),
        if (dotExist)
          Positioned(
            top: 11,
            right: 12,
            child: Container(
              width: 8,
              height: 8,
              decoration: BoxDecoration(
                color: FsColors.primary,
                shape: BoxShape.circle,
              ),
            ),
          ),
      ],
    ),
  );
}

Widget priceWidget(String price) {
  return RichText(
    text: TextSpan(
      children: [
        TextSpan(
          text: "\$$price",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        TextSpan(
          text: "/kg",
          style: TextStyle(color: Colors.black38, fontWeight: FontWeight.bold),
        ),
      ],
    ),
  );
}
