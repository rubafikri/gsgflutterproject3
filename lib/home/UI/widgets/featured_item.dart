import 'package:flutter/material.dart';
import 'package:flutter_application_2/home/UI/detailes.dart';
import 'package:flutter_application_2/home/models/Product.dart';

const kTextColor = Color(0xFF535353);
const kTextLightColor = Color(0xFFACACAC);

const kDefaultPaddin = 0.0;

class FeaturedItem extends StatefulWidget {
  Product product;

  FeaturedItem(this.product);

  @override
  _FeaturedItemState createState() => _FeaturedItemState();
}

class _FeaturedItemState extends State<FeaturedItem> {
  Color _color = Colors.white;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return DetailedScreen(widget.product);
        }));
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 27, top: 19, bottom: 12),
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    widget.product.image1,
                    fit: BoxFit.cover,
                    width: 151,
                    height: 181,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _color = Colors.red;
                    });
                    print('object');
                  },
                  child: Padding(
                      padding: const EdgeInsets.only(left: 110, top: 15),
                      child: Icon(
                        Icons.favorite,
                        color: _color,
                        size: 30,
                      )),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 28),
            child: Text(
              "\$${widget.product.price}",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 28),
            child: Text(
              // products is out demo list
              widget.product.title,
              style: TextStyle(color: Colors.black, fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
