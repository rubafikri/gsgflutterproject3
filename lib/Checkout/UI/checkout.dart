import 'package:flutter/material.dart';
import 'package:flutter_application_2/home/UI/widgets/cartScreenWidget.dart';
import 'package:flutter_application_2/widget/headerPages.dart';

class CheckoutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              HeaderPagesWidget('Checkout'),
              CartWidget(),
              CartWidget(),
              Container(
                padding: EdgeInsets.only(left: 10, top: 30, bottom: 19),
                child: ListTile(
                  title: Text(
                    '''Shewrapara, Mirpur, Dhaka-1216
House no: 938
Road no: 9''',
                    style: TextStyle(fontSize: 17),
                  ),
                  trailing: Radio(
                    value: 1,
                    activeColor: Colors.blue,
                    toggleable: true,
                    groupValue: 1,
                    hoverColor: Colors.blue,
                    onChanged: (c) {},
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 24, right: 24, bottom: 20),
                child: Divider(
                  thickness: 2.0,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 24, right: 24, bottom: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Subtotal',
                      style: TextStyle(fontSize: 17),
                    ),
                    Text(
                      '\$160.00',
                      style: TextStyle(fontSize: 17),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 24, right: 24, bottom: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Discount',
                      style: TextStyle(fontSize: 17),
                    ),
                    Text(
                      '5%',
                      style: TextStyle(fontSize: 17),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 24, right: 24, bottom: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Shipping',
                      style: TextStyle(fontSize: 17),
                    ),
                    Text(
                      '\$10.00',
                      style: TextStyle(fontSize: 17),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 24, right: 24),
                child: Divider(
                  thickness: 2.0,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 24, right: 24, bottom: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total',
                      style: TextStyle(fontSize: 17),
                    ),
                    Text(
                      '\$162.00',
                      style: TextStyle(fontSize: 17),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  margin: EdgeInsets.only(left: 24, right: 24, bottom: 24),
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
                  width: double.infinity,
                  height: 50,
                  // ignore: deprecated_member_use
                  child: FlatButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return CheckoutScreen();
                      }));
                    },
                    child: Text(
                      'Buy',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
