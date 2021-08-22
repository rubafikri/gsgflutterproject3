import 'dart:convert';

import 'package:flutter/material.dart';

class RegisterRequest {
  String id;
  String email;
  String password;
  String city;
  String country;
  String firstName;
  String lastName;
  RegisterRequest({
    @required this.id,
    @required this.email,
    @required this.password,
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

  factory RegisterRequest.fromMap(Map<String, dynamic> map) {
    return RegisterRequest(
      id: map['id'],
      email: map['email'],
      password: map['password'],
      city: map['city'],
      country: map['country'],
      firstName: map['firstName'],
      lastName: map['lastName'],
    );
  }
}
