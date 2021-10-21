import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/Admin/addProduct.dart';
import 'package:flutter_application_2/Admin/controlPannel.dart';
import 'package:flutter_application_2/Admin/provider/adminProvider.dart';
import 'package:flutter_application_2/Admin/viewAllProduct.dart';
import 'package:flutter_application_2/Auth/UI/Auth.dart';
import 'package:flutter_application_2/Auth/UI/Login.dart';
import 'package:flutter_application_2/Auth/UI/Signup.dart';
import 'package:flutter_application_2/Auth/UI/Splash.dart';
import 'package:flutter_application_2/home/UI/Home.dart';
import 'package:flutter_application_2/services/routes_helper.dart';
import 'package:provider/provider.dart';
import 'Auth/provider/auth_provider.dart';

void main() {
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthProvider>(
          create: (context) => AuthProvider(),
        ),
        ChangeNotifierProvider<AdminProvider>(
          create: (context) => AdminProvider(),
        ),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          routes: {
            LoginScreen.routeName: (context) => LoginScreen(),
            SignUpScreen.routeName: (context) => SignUpScreen(),
            HomeScreen.routeName: (context) => HomeScreen(),
            AuthMainScreen.routeName: (context) => AuthMainScreen(),
            ControlPannelScreen.routeName: (context) => ControlPannelScreen(),
            AddProductScreen.routeName: (context) => AddProductScreen(),
            ViewAllProductsScreen.routeName: (context) =>
                ViewAllProductsScreen(),
          },
          navigatorKey: RouteHelper.routeHelper.navKey,
          home: FirebaseConfiguration())));
}

class FirebaseConfiguration extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
            return ControlPannelScreen();
          }
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        });
  }
}
