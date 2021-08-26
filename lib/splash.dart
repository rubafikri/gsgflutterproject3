import 'package:flutter/material.dart';
import 'package:flutter_application_2/Auth/providers/auth_provider.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 2)).then((value) =>
        Provider.of<AuthProvider>(context, listen: false).checkLogin());
    return Scaffold(
      body: Center(
        child: Text('Splash Screen'),
      ),
    );
  }
}
