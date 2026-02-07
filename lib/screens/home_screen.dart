import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fruit_shop/data/data.dart';
import 'package:fruit_shop/screens/details_screen.dart';
import 'package:fruit_shop/utils/colors.dart';
import 'package:fruit_shop/utils/icon_widget.dart';
import 'package:fruit_shop/widgets/product_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: FsColors.secondary,
                      backgroundImage: AssetImage("assets/images/user.png"),
                    ),
                    SizedBox(width: 5),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Welcome back",
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black87,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        Text(
                          "Park Hyung Sik",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    iconWidget(FontAwesomeIcons.bagShopping, true),
                  ],
                ),
                SizedBox(height: 30),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Get Your Fresh Items\n",
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.black87,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      TextSpan(
                        text: "with ",
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.black87,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      TextSpan(
                        text: "Fruit Shop",
                        style: TextStyle(
                          fontSize: 35,
                          color: Colors.black87,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30),
                Row(
                  children: [
                    Container(
                      height: 70,
                      width: MediaQuery.of(context).size.width * 0.70,
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.white,
                        boxShadow: boxShadow,
                      ),
                      child: Row(
                        children: [
                          Icon(
                            FontAwesomeIcons.magnifyingGlass,
                            size: 25,
                            color: FsColors.primary,
                          ),
                          SizedBox(width: 15),
                          Text(
                            "Search pineapple",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w300,
                              color: Colors.black38,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Spacer(),
                    Container(
                      height: 68,
                      width: 68,
                      decoration: BoxDecoration(
                        color: FsColors.primary,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(FontAwesomeIcons.filter, color: Colors.white),
                    ),
                  ],
                ),
                SizedBox(
                  height: 80,
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: data.length,
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.only(top: 20),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          data[index].name,
                          style: TextStyle(
                            fontSize: 16,
                            color: index == 0
                                ? FsColors.primary
                                : Colors.black45,
                            fontWeight: index == 0
                                ? FontWeight.bold
                                : FontWeight.w400,
                          ),
                        ),
                      );
                    },
                  ),
                ),
                GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 40,
                  ),
                  itemCount: data[0].products!.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailsScreen(
                              product: data[0].products![index],
                            ),
                          ),
                        );
                      },
                      child: ProductWidget(product: data[0].products![index]),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
