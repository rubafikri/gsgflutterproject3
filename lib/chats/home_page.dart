import 'package:flutter/material.dart';
import 'package:flutter_application_2/Auth/helpers/firestore_helper.dart';
import 'package:flutter_application_2/chats/profile.dart';
import 'package:flutter_application_2/chats/users.dart';

class HomePage extends StatelessWidget {
  static final routeName = 'home';
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          body: TabBarView(
        children: [Profile(), Users()],
      )),
    );
  }
}
