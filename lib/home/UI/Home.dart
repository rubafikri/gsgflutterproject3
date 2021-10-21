import 'package:flutter/material.dart';
import 'package:flutter_application_2/home/UI/Featured.dart';
import 'package:flutter_application_2/home/UI/widgets/catregory_widget.dart';
import 'package:flutter_application_2/home/UI/widgets/featured_item.dart';
import 'package:flutter_application_2/home/UI/widgets/home_header_widget.dart';
import 'package:flutter_application_2/home/UI/widgets/navigation_widget.dart';
import 'package:flutter_application_2/home/UI/widgets/search_field_widget.dart';
import 'package:flutter_application_2/home/models/Product.dart';
import 'package:flutter_application_2/home/services/imagenamea.dart';

import 'cart.dart';

class HomeScreen extends StatefulWidget {
  static final String routeName = 'home';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        drawer: NavigationWidget(),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () {
                          _scaffoldKey.currentState.openDrawer();
                        },
                        icon: Icon(Icons.menu_rounded)),
                    Row(
                      children: [
                        IconButton(
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return CartScreen();
                              }));
                            },
                            icon: Icon(Icons.shopping_cart_outlined)),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.filter_alt_outlined)),
                      ],
                    )
                  ],
                ),
                SearchField(),
                CategoryWidget(),
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 43, left: 27, right: 27),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Featured',
                            style: TextStyle(fontSize: 20),
                          ),
                          GestureDetector(
                            child: Text('See all'),
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return FeaturedScreen();
                              }));
                            },
                          )
                        ],
                      ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          FeaturedItem(Product(
                              id: '1',
                              image1: ImagesName.Cat1Image,
                              image2:ImagesName.Cat2Image,
                              image3: ImagesName.Cat3Image,
                              title: 'title',
                              price: '12.0',
                              description:
                                  'A wonderful serenity has taken possession of my entire soul, like these sweet mornings of spring which I enjoy with my whole heart. I am alone, and feel the charm of existence in this spot, which was created for the bliss of souls like mine.')),
                          FeaturedItem(Product(
                              id: '1',
                              image1: ImagesName.Cat1Image,
                              image2:ImagesName.Cat2Image,
                              image3: ImagesName.Cat3Image,
                              title: 'Black turtleneck top',
                              price: '12.0',
                              description:
                                  'A wonderful serenity has taken possession of my entire soul, like these sweet mornings of spring which I enjoy with my whole heart. I am alone, and feel the charm of existence in this spot, which was created for the bliss of souls like mine.')),
                          FeaturedItem(Product(
                              id: '1',
                              image1: ImagesName.Cat1Image,
                              image2:ImagesName.Cat2Image,
                              image3: ImagesName.Cat3Image,
                              title: 'title',
                              price: '12.0',
                              description: 'description'))
                        ],
                      ),
                    ),
                    Column(children: [
                      Padding(
                        padding: EdgeInsets.only(top: 43, left: 27, right: 27),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Best Sell',
                              style: TextStyle(fontSize: 20),
                            ),
                            GestureDetector(
                              child: Text('See all'),
                              onTap: () {},
                            )
                          ],
                        ),
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            FeaturedItem(Product(
                                id: ' 1',
                                image1: ImagesName.Cat1Image,
                                image2:ImagesName.Cat2Image,
                                image3: ImagesName.Cat3Image,
                                title: 'title',
                                price: '12.0',
                                description: 'description')),
                            FeaturedItem(Product(
                                id: '1',
                                image1: ImagesName.Cat1Image,
                                image2:ImagesName.Cat2Image,
                                image3: ImagesName.Cat3Image,
                                title: 'title',
                                price: '12.0',
                                description: 'description')),
                            FeaturedItem(Product(
                                id: '1',
                                image1: ImagesName.Cat1Image,
                                image2:ImagesName.Cat2Image,
                                image3: ImagesName.Cat3Image,
                                title: 'title',
                                price: '12.0',
                                description: 'description'))
                          ],
                        ),
                      ),
                    ]),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
