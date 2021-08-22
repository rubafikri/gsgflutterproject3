import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/Auth/helpers/auth_helper.dart';
import 'package:flutter_application_2/Auth/helpers/firestoreHelper.dart';
import 'package:flutter_application_2/Auth/ui/loginPage.dart';
import 'package:flutter_application_2/chats/home_page.dart';
import 'package:flutter_application_2/models/registerRequest.dart';
import 'package:flutter_application_2/services/custom_dialoug.dart';
import 'package:flutter_application_2/services/routes_helper.dart';

class AuthProvider extends ChangeNotifier {
  TabController tabController;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController country = TextEditingController();
  TextEditingController city = TextEditingController();

  resetControllers() {
    emailController.clear();
    passwordController.clear();
  }

  register() async {
    try {
      UserCredential userCredential = await AuthHelper.authHelper
          .signup(emailController.text, passwordController.text);
      RegisterRequest registerRequest = RegisterRequest(
          id: userCredential.user.uid,
          email: emailController.text,
          password: passwordController.text,
          city: city.text,
          country: country.text,
          firstName: firstName.text,
          lastName: lastName.text);

      await FirestoreHelper.firestoreHelper.addUserToFirestore(registerRequest);

      await AuthHelper.authHelper.verifyEmail();
      await AuthHelper.authHelper.logout();
      RouteHelper.routeHelper.goToPage(Login_Page.routeName);
    } on Exception catch (e) {
      print(e);
    }
// navigate to login

    resetControllers();
  }

  login() async {
    UserCredential userCredential = await AuthHelper.authHelper
        .signin(emailController.text, passwordController.text);
    // bool isVerifiedEmail = AuthHelper.authHelper.checkEmailVerification();
    // if (isVerifiedEmail) {
    FirestoreHelper.firestoreHelper
        .getUserFromFirestore(userCredential.user.uid);
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
}
