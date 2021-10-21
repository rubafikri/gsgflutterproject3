import 'package:flutter/material.dart';

class HeaderPagesWidget extends StatelessWidget {
  String name;
  HeaderPagesWidget(this.name);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          child: Text(
            name,
            style: Theme.of(context)
                .textTheme
                .headline5
                .copyWith(fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
