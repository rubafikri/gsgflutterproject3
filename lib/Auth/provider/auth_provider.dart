import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/Auth/UI/Auth.dart';
import 'package:flutter_application_2/Auth/helpers/auth_helper.dart';
import 'package:flutter_application_2/Auth/helpers/firestore_helper.dart';
import 'package:flutter_application_2/Auth/models/UserModel.dart';
import 'package:flutter_application_2/Auth/models/register_request.dart';
import 'package:flutter_application_2/home/UI/Home.dart';
import 'package:flutter_application_2/services/routes_helper.dart';

class AuthProvider extends ChangeNotifier {
  List<UserModel> users;
  String myId;
  AuthProvider();

  TabController tabController;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController cituController = TextEditingController();

  getAllUsers() async {
    users = await FirestoreHelper.firestoreHelper.getAllUsersFromFirestore();
    users.removeWhere((element) => element.id == myId);
    notifyListeners();
  }

  UserModel user;
  getUserFromFirestore() async {
    String userId = AuthHelper.authHelper.getUserId();
    user = await FirestoreHelper.firestoreHelper.getUserFromFirestore(userId);
    notifyListeners();
  }

  resetControllers() {
    emailController.clear();
    passwordController.clear();
  }

///////////////////////////////////////////////////

///////////////////////////////////////////////////
  register() async {
    try {
      UserCredential userCredential = await AuthHelper.authHelper
          .signup(emailController.text, passwordController.text);

      RegisterRequest registerRequest = RegisterRequest(
          id: userCredential.user.uid,
          email: emailController.text,
          fName: firstNameController.text,
          password: passwordController.text);
      await FirestoreHelper.firestoreHelper.addUserToFirestore(registerRequest);
      RouteHelper.routeHelper.goToPage(HomeScreen.routeName);
    } on Exception catch (e) {
      print(e);
    }
// navigate to login

    resetControllers();
  }

  logout() async {
    await AuthHelper.authHelper.logout();
    RouteHelper.routeHelper.goToPageWithReplacement(AuthMainScreen.routeName);
  }

  login() async {
    UserCredential userCredinial = await AuthHelper.authHelper
        .signin(emailController.text, passwordController.text);
    FirestoreHelper.firestoreHelper
        .getUserFromFirestore(userCredinial.user.uid);

    RouteHelper.routeHelper.goToPageWithReplacement(HomeScreen.routeName);

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
    bool isLoggedIn = AuthHelper.authHelper.checkUserLoging();
    print(FirebaseAuth.instance.currentUser);
    if (isLoggedIn) {
      this.myId = AuthHelper.authHelper.getUserId();
      getAllUsers();
      RouteHelper.routeHelper.goToPageWithReplacement(HomeScreen.routeName);
    } else {
      RouteHelper.routeHelper.goToPageWithReplacement(AuthMainScreen.routeName);
    }
  }

  fillControllers() {
    emailController.text = user.email;
    firstNameController.text = user.fName;
    lastNameController.text = user.lName;
    countryController.text = user.country;
    cituController.text = user.city;
  }

  updateProfile() async {
    String imageUrl;

    UserModel userModel = imageUrl == null
        ? UserModel(
            city: cituController.text,
            country: countryController.text,
            fName: firstNameController.text,
            lName: lastNameController.text,
            id: user.id)
        : UserModel(
            city: cituController.text,
            country: countryController.text,
            fName: firstNameController.text,
            lName: lastNameController.text,
            id: user.id,
            imageUrl: imageUrl);

    await FirestoreHelper.firestoreHelper.updateProfile(userModel);
    getUserFromFirestore();
    Navigator.of(RouteHelper.routeHelper.navKey.currentContext).pop();
  }
}
