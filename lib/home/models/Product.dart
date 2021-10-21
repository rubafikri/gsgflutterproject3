import 'dart:convert';

import 'package:flutter/material.dart';

class Product {
  String id;
  String title;
  String description;
  String image1;
  String image2;
  String image3;
  double rating;
  String price;
  bool isFavourite;
  bool isPopular;

  Product({
    this.id,
    this.image1,
    this.image2,
    this.image3,
    this.rating = 0.0,
    this.isFavourite = false,
    this.isPopular = false,
    this.title,
    @required this.price,
    @required this.description,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'image1': image1,
      'image2': image2,
      'image3': image3,
      'rating': rating,
      'price': price,
      'isFavourite': isFavourite,
      'isPopular': isPopular,
    };
  }

  Product.fromMap(Map map) {
    id = map['id'];
    title = map['title'];
    description = map['description'];
    image1 = map['image1'];
    image2 = map['image2'];
    image3 = map['image3'];
    rating = map['rating'];
    price = map['price'];
    isFavourite = map['isFavourite'];
    isPopular = map['isPopular'];
  }
}
