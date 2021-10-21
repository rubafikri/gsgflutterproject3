import 'package:flutter/material.dart';
import 'package:flutter_application_2/home/UI/widgets/featured_item.dart';
import 'package:flutter_application_2/home/models/Product.dart';
import 'package:flutter_application_2/home/services/imagenamea.dart';

class FeaturedWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
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
                onTap: () {},
              )
            ],
          ),
        ),
        Row(
          children: [
            FeaturedItem(Product(
                id: '1',
                image1: ImagesName.Cat1Image,
                image2:ImagesName.Cat2Image,
                title: 'title',
                price: '12.0',
                description: 'description'))
          ],
        ),
      ],
    );
  }
}
