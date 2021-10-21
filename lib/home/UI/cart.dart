import 'package:flutter/material.dart';
import 'package:flutter_application_2/home/UI/widgets/cart.dart';
import 'package:flutter_application_2/home/UI/widgets/cartScreenWidget.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomListItem(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Container(
          margin: EdgeInsets.only(left: 24, right: 24),
          width: double.infinity,
          height: 50,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Color(0xff64B6FF),
                Color(0xff667EEA),
              ],
            ),
          ),
          child: FloatingActionButton(
            child: Text(
              'Continue',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            shape: BeveledRectangleBorder(borderRadius: BorderRadius.zero),
            onPressed: () {
              print("Button is pressed.");
              //task to execute when this button is pressed
            },
          ),
        ),
      ),
    );
  }
}
