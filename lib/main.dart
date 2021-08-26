import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/chats/profile.dart';
import 'package:flutter_application_2/chats/users.dart';
import 'package:flutter_application_2/services/routes_helper.dart';
import 'package:flutter_application_2/splash.dart';
import 'package:provider/provider.dart';

import 'Auth/providers/auth_provider.dart';
import 'Auth/ui/auth_main_page.dart';

import 'Auth/ui/login_page.dart';
import 'Auth/ui/register_page.dart';
import 'Auth/ui/reset_password_page.dart';
import 'chats/home_page.dart';

void main() {
  runApp(ChangeNotifierProvider<AuthProvider>(
      create: (context) => AuthProvider(),
      child: MaterialApp(
          routes: {
            LoginPage.routeName: (context) => LoginPage(),
            RegisterPage.routeName: (context) => RegisterPage(),
            ResetPasswordPage.routeName: (context) => ResetPasswordPage(),
            HomePage.routeName: (context) => HomePage(),
            AuthMainPage.routeName: (context) => AuthMainPage(),
            Profile.routeName: (context) => Profile(),
            Users.routeName: (context) => Users(),
          },
          navigatorKey: RouteHelper.routeHelper.navKey,
          home: FirebaseConfiguration())));
}

class FirebaseConfiguration extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return FutureBuilder<FirebaseApp>(
        future: Firebase.initializeApp(),
        builder: (context, AsyncSnapshot<FirebaseApp> dataSnapShot) {
          if (dataSnapShot.hasError) {
            return Scaffold(
              backgroundColor: Colors.red,
              body: Center(
                child: Text(dataSnapShot.error.toString()),
              ),
            );
          }
          if (dataSnapShot.connectionState == ConnectionState.done) {
            return SplashScreen();
          }
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        });
  }
}
