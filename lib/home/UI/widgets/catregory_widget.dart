import 'package:flutter/material.dart';
import 'package:flutter_application_2/home/UI/widgets/cat_item_widget.dart';
import 'package:flutter_application_2/home/services/imagenamea.dart';

class CategoryWidget extends StatelessWidget {
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
                'Categories',
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
              CatItem('Funny', 0xff667EEA, 0xff64B6FF, ImagesName.Cat1Image),
              CatItem('Funny', 0xffFF5858, 0xffFB5895, ImagesName.Cat2Image),
              CatItem('Funny', 0xff43E97B, 0xff38F9D7, ImagesName.Cat3Image),
            ],
          ),
        ),
      ],
    );
  }
}
