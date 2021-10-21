import 'dart:convert';

import 'package:flutter/material.dart';

class Category {
  String catName;
  String catId;
  Category({
    @required this.catName,
    @required this.catId,
  });

  Map<String, dynamic> toMap() {
    return {
      'catName': catName,
      'catId': catId,
    };
  }

  Category.fromMap(Map<String, dynamic> map) {
    Category(
      catName: map['catName'],
      catId: map['catId'],
    );
  }
}
