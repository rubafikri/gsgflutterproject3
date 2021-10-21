import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_2/Admin/controlPannel.dart';
import 'package:flutter_application_2/Admin/helpers/firestorageHelper.dart';
import 'package:flutter_application_2/Admin/helpers/firstoreHelper.dart';
import 'package:flutter_application_2/Auth/helpers/firestore_helper.dart';
import 'package:flutter_application_2/home/models/Product.dart';
import 'package:flutter_application_2/services/routes_helper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

class AdminProvider extends ChangeNotifier {
  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController catController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController isFeaturd = TextEditingController();
  bool isFeatured = false;
  bool isPopular = false;
  List<Product> products;

  var uuid = Uuid();
  resetControllers() {
    nameController.clear();
    priceController.clear();
    catController.clear();
    descriptionController.clear();
    isFeaturd.clear();
  }

  File file;
  selectFile() async {
    XFile imageFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    this.file = File(imageFile.path);
    notifyListeners();
  }

  File file2;
  selectFile2() async {
    XFile imageFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    this.file2 = File(imageFile.path);
    notifyListeners();
  }

  File file33;
  selectFile3() async {
    XFile imageFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    this.file33 = File(imageFile.path);
    notifyListeners();
  }
//  String imageUrl =
  //    await FirebaseStorageHelper.firebaseStorageHelper.uploadImage(file);

  addPro() async {
    try {
      String imageUrl =
          await FirebaseStorageHelper.firebaseStorageHelper.uploadImage(file);

      String imageUrl2 =
          await FirebaseStorageHelper.firebaseStorageHelper.uploadImage(file2);
      String imageUrl3 =
          await FirebaseStorageHelper.firebaseStorageHelper.uploadImage(file33);
      FirestoreHelperProduct.firestoreHelper.addProToFirestore(Product(
          id: uuid.v4(),
          description: descriptionController.text,
          price: priceController.text,
          title: nameController.text,
          image1: imageUrl,
          image2: imageUrl2,
          image3: imageUrl3,
          isFavourite: isFeatured,
          isPopular: isPopular));

      RouteHelper.routeHelper.goToPage(ControlPannelScreen.routeName);
    } on Exception catch (e) {
      // TODO
    }
// navigate to login

    resetControllers();
    notifyListeners();
  }

  getAllPros() async {
    products = await FirestoreHelperProduct.firestoreHelper
        .getAllProductsFromFirestore();
    print(products[1].description);
    notifyListeners();
  }
}
