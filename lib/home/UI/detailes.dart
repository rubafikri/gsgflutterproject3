import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_application_2/home/models/Product.dart';

class DetailedScreen extends StatelessWidget {
  Product product;
  DetailedScreen(this.product);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(
                top: 10,
                left: 20,
                right: 28,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back)),
                  Row(
                    children: [
                      IconButton(onPressed: () {}, icon: Icon(Icons.search)),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.shopping_cart_outlined)),
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 40,
                top: 31,
                bottom: 33,
              ),
              child: ImageSlideshow(
                width: 327,
                height: 175,
                initialPage: 0,
                indicatorColor: Colors.blue,
                indicatorBackgroundColor: Colors.white,
                children: [
                  // Image.asset(
                  //   // product.images[0],
                  //   fit: BoxFit.cover,
                  // ),
                  // Image.asset(
                  //   product.images[1],
                  //   fit: BoxFit.cover,
                  // ),
                  // Image.asset(
                  //   product.images[2],
                  //   fit: BoxFit.cover,
                  // ),
                ],
                autoPlayInterval: 5000,
                isLoop: true,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25, bottom: 23),
              child: Text(
                product.title,
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 25, bottom: 17),
                  child: Text(
                    "\$${product.price}",
                    style: TextStyle(fontSize: 25, color: Color(0xff667EEA)),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25, bottom: 20),
              child: Text(
                'Description',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25, bottom: 23, right: 38),
              child: Text(
                product.description,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
            Spacer(),
            Spacer(), // use this
            // use this

            Row(
              children: [
                Align(
                  alignment: Alignment.bottomLeft,
                  child: MaterialButton(
                    color: Colors.grey,
                    height: 55,
                    minWidth: 205,
                    onPressed: () => {},
                    child: Text('ADD TO CART',
                        style: TextStyle(color: Colors.black, fontSize: 20)),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: MaterialButton(
                    color: Colors.blue,
                    height: 55,
                    minWidth: 206,
                    onPressed: () => {},
                    child: Text('BUY NOW',
                        style: TextStyle(color: Colors.white, fontSize: 20)),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
