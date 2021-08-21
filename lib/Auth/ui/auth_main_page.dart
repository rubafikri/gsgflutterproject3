import 'package:flutter/material.dart';
import 'package:flutter_application_2/Auth/providers/auth_provider.dart';
import 'package:flutter_application_2/Auth/ui/Register.dart';
import 'package:flutter_application_2/Auth/ui/loginPage.dart';

import 'package:provider/provider.dart';

class AuthMainPage extends StatefulWidget {
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
        appBar: AppBar(
          title: Text('Main Page'),
          bottom: TabBar(
              controller: Provider.of<AuthProvider>(context).tabController,
              tabs: [
                Tab(
                  text: 'Register',
                ),
                Tab(
                  text: 'Login',
                )
              ]),
        ),
        body: TabBarView(
          controller: Provider.of<AuthProvider>(context).tabController,
          children: [Register_Page(), Login_Page()],
        ));
  }
}