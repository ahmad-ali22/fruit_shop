import 'dart:async';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fruit_shop/utils/colors.dart';
import 'package:slide_to_act/slide_to_act.dart';

import 'home_screen.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 12,),
              Text(
                "HAY MARKETS",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.1,
                  color: FsColors.primary,
                ),
              ),
              SizedBox(height: 18),
              Text(
                "First Online",
                style: TextStyle(
                  fontSize: 60,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0.1,
                  height: 1,
                ),
              ),
              Text(
                "Market",
                style: TextStyle(
                  fontSize: 60,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.5,
                  height: 1.2,
                ),
              ),
              SizedBox(height: 15),
              Text(
                "Our market always provide fresh items from the local farmers, let's support local with us!",
                style: TextStyle(
                  color: Colors.black54,
                  height: 1.6,
                  fontSize: 15,
                ),
              ),
              SizedBox(height: 30),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.40,
                width: MediaQuery.of(context).size.width,
                child: Image.asset(
                  "assets/images/bg.png",
                  fit: BoxFit.fitWidth,
                ),
              ),
              Spacer(),
              Column(
                children: [
                  SlideAction(
                    outerColor: FsColors.primary,
                    innerColor: Colors.white,
                    sliderButtonIcon: Icon(
                      FontAwesomeIcons.arrowRight,
                      color: FsColors.primary,
                      size: 20,
                    ),
                    text: "SWIPE TO START",
                    textStyle: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    onSubmit: () {
                      Timer(
                        Duration(milliseconds: 500),
                        () => Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HomeScreen()),
                        ),
                      );
                    },
                  ),
                  SizedBox(height: 20,),
                  RichText(text: TextSpan(
                    children: [
                      TextSpan(
                        text: "HOW TO SUPPORT ",
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.black54,
                          fontWeight: FontWeight.bold
                        )
                      ),
                      TextSpan(
                        text: "LOCAL FARMERS",
                          style: TextStyle(
                              fontSize: 13,
                              color: FsColors.primary,
                              fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline
                          )
                      )
                    ]
                  ))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
