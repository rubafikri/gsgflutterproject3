import 'package:flutter/material.dart';
import 'package:flutter_application_2/Admin/addProduct.dart';
import 'package:flutter_application_2/Admin/helpers/firstoreHelper.dart';
import 'package:flutter_application_2/Admin/viewAllProduct.dart';
import 'package:flutter_application_2/services/routes_helper.dart';

class ControlPannelScreen extends StatelessWidget {
  static String routeName = 'control';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlatButton(
                onPressed: () {
                  RouteHelper.routeHelper.goToPage(AddProductScreen.routeName);
                },
                child: Text('Add Product')),
            FlatButton(onPressed: () {}, child: Text('Edit Product')),
            FlatButton(
                onPressed: () async {
                  RouteHelper.routeHelper
                      .goToPage(ViewAllProductsScreen.routeName);
                },
                child: Text('View Product')),
            FlatButton(onPressed: () {}, child: Text('View Orders')),
            FlatButton(onPressed: () {}, child: Text('Confirm Orders'))
          ],
        ),
      ),
    );
  }
}
