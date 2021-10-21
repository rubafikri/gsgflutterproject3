import 'package:flutter/material.dart';
import 'package:flutter_application_2/Auth/UI/Login.dart';
import 'package:flutter_application_2/Auth/UI/Signup.dart';
import 'package:flutter_application_2/Auth/provider/auth_provider.dart';
import 'package:flutter_application_2/services/routes_helper.dart';
import 'package:provider/provider.dart';

class AuthMainScreen extends StatelessWidget {
  static final String routeName = 'authPage';

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(builder: (context, provider, x) {
      return Scaffold(
        body: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Text(
                  'Welcome to Bolt',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Explore Us',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(
                height: 150,
              ),
              Container(
                width: 250,
                height: 200,
                child: Image(
                  image: AssetImage('assets/images/Image.png'),
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                height: 100,
              ),
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      Color(0xff667EEA),
                      Color(0xff64B6FF),
                    ],
                  ),
                ),
                width: 250,
                height: 50,
                child: FlatButton(
                  onPressed: () {
                    RouteHelper.routeHelper.goToPage(LoginScreen.routeName);
                  },
                  child: Text(
                    'Login',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              GestureDetector(
                child: Text('Sign Up'),
                onTap: () {
                  RouteHelper.routeHelper.goToPage(SignUpScreen.routeName);
                },
              )
            ],
          ),
        ),
      );
    });
  }
}
