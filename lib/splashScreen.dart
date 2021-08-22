import 'package:flutter/material.dart';
import 'package:flutter_application_2/Auth/ui/Register.dart';
import 'package:flutter_application_2/services/routes_helper.dart';
import 'package:provider/provider.dart';

import 'Auth/providers/auth_provider.dart';
import 'chats/home_page.dart';

class SplachScreen extends StatelessWidget {
  static final routeName = 'splachScreen';
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 2)).then((value) {
      bool userExisting =
          Provider.of<AuthProvider>(context, listen: false).checkUser();
      if (userExisting) {
        RouteHelper.routeHelper.goToPageWithReplacement(HomePage.routeName);
      } else {
        RouteHelper.routeHelper
            .goToPageWithReplacement(Register_Page.routeName);
      }
    });
    // TODO: implement build
    return Scaffold(
      body: Center(
        child: FlutterLogo(
          size: 30,
        ),
      ),
    );
  }
}
