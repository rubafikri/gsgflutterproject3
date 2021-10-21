import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/Auth/helpers/auth_helper.dart';
import 'package:flutter_application_2/Auth/models/UserModel.dart';
import 'package:flutter_application_2/Auth/models/register_request.dart';
import 'package:flutter_application_2/home/models/Product.dart';
import 'package:flutter_application_2/home/services/imagenamea.dart';

class FirestoreHelperProduct {
  FirestoreHelperProduct._();
  static FirestoreHelperProduct firestoreHelper = FirestoreHelperProduct._();
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  addProToFirestore(Product product) async {
    try {
      await firebaseFirestore
          .collection('Products')
          .doc(product.id)
          .set(product.toMap());
    } on Exception catch (e) {
      print(e);
    }
  }

  Future<List<Product>> getAllProductsFromFirestore() async {
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await firebaseFirestore.collection('Products').get();

      List<QueryDocumentSnapshot<Map<String, dynamic>>> docs =
          querySnapshot.docs;
      print(querySnapshot.docs);

      List<Product> products =
          docs.map((e) => Product.fromMap(e.data())).toList();

      print('heloo');
      return products;
    } on Exception catch (e) {
      print('exception $e');
    }
  }

  deleteHerb(String id) async {
    await firebaseFirestore.collection('Products').doc(id).delete();
    print(id);
  }

  editProduct(Product product, String id) async {
    await firebaseFirestore
        .collection('Products')
        .doc(id)
        .set({...product.toMap()});
  }

  updateProfile(UserModel userModel) async {
    await firebaseFirestore
        .collection('Users')
        .doc(userModel.id)
        .update(userModel.toMap());
  }
}
