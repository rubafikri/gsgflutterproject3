import 'package:flutter/material.dart';
import 'package:flutter_application_2/home/UI/cart.dart';
import 'package:flutter_application_2/home/UI/widgets/navigation_widget.dart';

class HomeHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
            onPressed: () {
              Drawer(
                child: NavigationWidget(),
              );
            },
            icon: Icon(Icons.menu_rounded)),
        Row(
          children: [
            IconButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return CartScreen();
                  }));
                },
                icon: Icon(Icons.shopping_cart_outlined)),
            IconButton(onPressed: () {}, icon: Icon(Icons.filter_alt_outlined)),
          ],
        )
      ],
    );
  }
}
