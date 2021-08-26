import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/Auth/helpers/auth_helper.dart';
import 'package:flutter_application_2/Auth/helpers/firestorage_helper.dart';
import 'package:flutter_application_2/Auth/helpers/firestore_helper.dart';
import 'package:flutter_application_2/Auth/models/country_model.dart';
import 'package:flutter_application_2/Auth/models/register_request.dart';
import 'package:flutter_application_2/Auth/models/user_model.dart';
import 'package:flutter_application_2/Auth/ui/auth_main_page.dart';
import 'package:flutter_application_2/chats/home_page.dart';
import 'package:flutter_application_2/services/routes_helper.dart';
import 'package:image_picker/image_picker.dart';

class AuthProvider extends ChangeNotifier {
  AuthProvider() {
    getCountriesFromFirestore();
  }
  TabController tabController;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController cituController = TextEditingController();
  UserModel userModel;
  getUserFromFirestore() async {
    String uid = AuthHelper.authHelper.getUserId();
    userModel = await FirestoreHelper.firestoreHelper.getUserFromFirestore(uid);
    notifyListeners();
  }

  resetControllers() {
    emailController.clear();
    passwordController.clear();
  }

  List<CountryModel> countries;
  List<dynamic> cities = [];
  CountryModel selectedCountry;
  String selectedCity;
  selectCountry(CountryModel countryModel) {
    this.selectedCountry = countryModel;
    this.cities = countryModel.cities;
    selectCity(cities.first.toString());
    notifyListeners();
  }

  selectCity(dynamic city) {
    this.selectedCity = city;
    notifyListeners();
  }

  getCountriesFromFirestore() async {
    List<CountryModel> countries =
        await FirestoreHelper.firestoreHelper.getAllCountries();
    this.countries = countries;
    selectCountry(countries.first);
    notifyListeners();
  }

///////////////////////////////////////////////////
  ///upload Image
  File file;
  selectFile() async {
    XFile imageFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    this.file = File(imageFile.path);
    notifyListeners();
  }

///////////////////////////////////////////////////
  register() async {
    try {
      UserCredential userCredential = await AuthHelper.authHelper
          .signup(emailController.text, passwordController.text);
      String imageUrl =
          await FirebaseStorageHelper.firebaseStorageHelper.uploadImage(file);
      RegisterRequest registerRequest = RegisterRequest(
          imageUrl: imageUrl,
          id: userCredential.user.uid,
          city: selectedCity,
          country: selectedCountry.name,
          email: emailController.text,
          fName: firstNameController.text,
          lName: lastNameController.text,
          password: passwordController.text);
      await FirestoreHelper.firestoreHelper.addUserToFirestore(registerRequest);
      await AuthHelper.authHelper.verifyEmail();
      await AuthHelper.authHelper.logout();
      tabController.animateTo(1);
    } on Exception catch (e) {
      // TODO
    }
// navigate to login

    resetControllers();
  }

  login() async {
    UserCredential userCredinial = await AuthHelper.authHelper
        .signin(emailController.text, passwordController.text);
    FirestoreHelper.firestoreHelper
        .getUserFromFirestore(userCredinial.user.uid);
    // bool isVerifiedEmail = AuthHelper.authHelper.checkEmailVerification();
    // if (isVerifiedEmail) {
    RouteHelper.routeHelper.goToPageWithReplacement(HomePage.routeName);
    // } else {
    //   CustomDialoug.customDialoug.showCustomDialoug(
    //       'You have to verify your email, press ok to send another email',
    //       sendVericiafion);
    // }
    resetControllers();
  }

  sendVericiafion() {
    AuthHelper.authHelper.verifyEmail();
    AuthHelper.authHelper.logout();
  }

  resetPassword() async {
    AuthHelper.authHelper.resetPassword(emailController.text);
    resetControllers();
  }

  checkLogin() {
    bool isLogged = AuthHelper.authHelper.checkUserLogin();
    if (isLogged) {
      RouteHelper.routeHelper.goToPage(HomePage.routeName);
    } else {
      RouteHelper.routeHelper.goToPage(AuthMainPage.routeName);
    }
  }

  logout() async {
    await AuthHelper.authHelper.logout();
    RouteHelper.routeHelper.goToPage(AuthMainPage.routeName);
  }
}
