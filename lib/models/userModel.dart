import 'package:flutter/material.dart';

class UserModel {
  String id;
  String email;
  String password;
  String city;
  String country;
  String firstName;
  String lastName;
  UserModel({
    @required this.id,
    @required this.email,
    @required this.city,
    @required this.country,
    @required this.firstName,
    @required this.lastName,
  });

  toMap() {
    return {
      'id': this.id,
      'email': this.email,
      'city': this.city,
      'country': this.country,
      'firstName': this.firstName,
      'lastName': this.lastName,
    };
  }

  UserModel.fromMap(Map map) {
    id:
    map['id'];
    email:
    map['email'];
    city:
    map['city'];
    country:
    map['country'];
    firstName:
    map['firstName'];
    lastName:
    map['lastName'];
  }
}
