import 'package:flutter/material.dart';
import 'package:flutter_application_2/home/UI/Favorite.dart';
import 'package:flutter_application_2/home/UI/Home.dart';
import 'package:flutter_application_2/home/UI/widgets/home_header_widget.dart';

class NavigationWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            child: Text(
              'Home',
              style: TextStyle(fontSize: 20, color: Colors.black),
            ),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return HomeScreen();
              }));
            },
          ),
          SizedBox(
            height: 20,
          ),
          GestureDetector(
            child: Text(
              'Profile',
              style: TextStyle(fontSize: 20, color: Colors.black),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          GestureDetector(
            child: Text(
              'My Cart',
              style: TextStyle(fontSize: 20, color: Colors.black),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          GestureDetector(
            child: Text(
              'Favorite',
              style: TextStyle(fontSize: 20, color: Colors.black),
            ),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return FavoriteScreen();
              }));
            },
          ),
          SizedBox(
            height: 20,
          ),
          GestureDetector(
            child: Text(
              'My Orders',
              style: TextStyle(fontSize: 20, color: Colors.black),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          GestureDetector(
            child: Text(
              'Language',
              style: TextStyle(fontSize: 20, color: Colors.black),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          GestureDetector(
            child: Text(
              'Feedback',
              style: TextStyle(fontSize: 20, color: Colors.black),
            ),
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
