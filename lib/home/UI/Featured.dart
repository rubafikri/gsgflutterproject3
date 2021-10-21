import 'package:flutter/material.dart';
import 'package:flutter_application_2/home/UI/widgets/featured_item.dart';
import 'package:flutter_application_2/home/models/Product.dart';
import 'package:flutter_application_2/home/services/imagenamea.dart';

class FeaturedScreen extends StatelessWidget {
  List<Product> products = [
    Product(
        id: '1',
        image1: ImagesName.Cat1Image,
        image2:ImagesName.Cat2Image,
        image3: ImagesName.Cat3Image,
        title: 'title',
        price: '10',
        description: 'description'),
    Product(
        id: '1',
        image1: ImagesName.Cat1Image,
        image2:ImagesName.Cat2Image,
        image3: ImagesName.Cat3Image,
        title: 'title',
        price: '10',
        description: 'description'),
    Product(
        id: '1',
        image1: ImagesName.Cat1Image,
        image2:ImagesName.Cat2Image,
        image3: ImagesName.Cat3Image,
        title: 'title',
        price: '10',
        description: 'description'),
    Product(
        id: '1',
        image1: ImagesName.Cat1Image,
        image2:ImagesName.Cat2Image,
        image3: ImagesName.Cat3Image,
        title: 'title',
        price: '10',
        description: 'description'),
    Product(
        id: '1',
        image1: ImagesName.Cat1Image,
        image2:ImagesName.Cat2Image,
        image3: ImagesName.Cat3Image,
        title: 'title',
        price: '10',
        description: 'description'),
    Product(
        id: '1',
        image1: ImagesName.Cat1Image,
        image2:ImagesName.Cat2Image,
        image3: ImagesName.Cat3Image,
        title: 'title',
        price: '10',
        description: 'description'),
    Product(
        id: '1',
        image1: ImagesName.Cat1Image,
        image2:ImagesName.Cat2Image,
        image3: ImagesName.Cat3Image,
        title: 'title',
        price: '10',
        description: 'description'),
  ];

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
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
            child: Text(
              "Featured",
              style: Theme.of(context)
                  .textTheme
                  .headline5
                  .copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
              child: GridView.builder(
                  itemCount: products.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: kDefaultPaddin,
                    crossAxisSpacing: kDefaultPaddin,
                    childAspectRatio: 0.75,
                  ),
                  itemBuilder: (context, index) => FeaturedItem(
                        products[index],
                      )),
            ),
          ),
        ],
      )),
    );
  }
}
