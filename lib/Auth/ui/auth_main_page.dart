import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/Auth/providers/auth_provider.dart';
import 'package:flutter_application_2/Auth/ui/register_page.dart';
import 'package:flutter_application_2/global_widgets/custom_button.dart';
import 'package:flutter_application_2/services/routes_helper.dart';
import 'package:provider/provider.dart';

import 'login_page.dart';

class AuthMainPage extends StatefulWidget {
  static final String routeName = 'authPage';
  @override
  _AuthMainPageState createState() => _AuthMainPageState();
}

class _AuthMainPageState extends State<AuthMainPage>
    with SingleTickerProviderStateMixin {
  @override
  initState() {
    super.initState();
    Provider.of<AuthProvider>(context, listen: false).tabController =
        TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Color(0xff1F1F1F),
      body: Consumer<AuthProvider>(
        builder: (context, provider, x) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                padding: EdgeInsets.only(bottom: 20, top: 20),
                child: Image.asset(
                  'assets/images/logo.png',
                ),
              ),
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.only(bottom: 30),
                child: Text(
                  'Create a free account',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.8),
                    fontSize: 20,
                  ),
                ),
              ),
              Container(
                height: 60,
                width: double.infinity,
                padding: EdgeInsets.only(left: 30, right: 30),
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: RaisedButton(
                  color: Color(0xffFA4C60),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  onPressed: () {
                    RouteHelper.routeHelper.goToPage(RegisterPage.routeName);
                  },
                  child: Text(
                    'Create an account',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              Container(
                height: 60,
                width: double.infinity,
                padding: EdgeInsets.only(left: 30, right: 30),
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: RaisedButton(
                  color: Color(0xff2B2B2B),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  onPressed: () {
                    RouteHelper.routeHelper.goToPage(LoginPage.routeName);
                  },
                  child: Text(
                    'Login',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
