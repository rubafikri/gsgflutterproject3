import 'package:flutter/material.dart';

class CatItem extends StatelessWidget {
  int color;
  int color2;
  String catName;
  String image;
  CatItem(this.catName, this.color, this.color2, this.image);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: (20), top: 20),
      child: GestureDetector(
        onTap: () {},
        child: SizedBox(
          width: (125),
          height: (80),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Stack(
              children: [
                Image.asset(
                  image,
                  fit: BoxFit.cover,
                ),
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        Color(color).withOpacity(0.7),
                        Color(color2).withOpacity(0.15),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: (35.0),
                    vertical: (30),
                  ),
                  child: Text.rich(
                    TextSpan(
                      style: TextStyle(color: Colors.white),
                      children: [
                        TextSpan(
                          text: "$catName\n",
                          style: TextStyle(
                              fontSize: (14),
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Segoe UI'),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
