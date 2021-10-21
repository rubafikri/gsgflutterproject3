import 'package:fdottedline/fdottedline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/Checkout/UI/checkout.dart';

class ChooseAddressScreen extends StatefulWidget {
  @override
  _ChooseAddressScreenState createState() => _ChooseAddressScreenState();
}

class _ChooseAddressScreenState extends State<ChooseAddressScreen> {
  int val = -1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(
                top: 10,
                left: 20,
                right: 28,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.arrow_back)),
                  IconButton(onPressed: () {}, icon: Icon(Icons.notifications))
                ],
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.all(30.0),
              child: Text(
                'Choose Address',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 25.0,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 20),
              child: ListTile(
                title: Text(
                  '''Shewrapara, Mirpur, Dhaka-1216
House no: 938
Road no: 9''',
                  style: TextStyle(fontSize: 17),
                ),
                trailing: Radio(
                  value: 1,
                  groupValue: val,
                  onChanged: (value) {
                    setState(() {
                      val = value;
                      print(val);
                    });
                  },
                  activeColor: Colors.blue,
                  toggleable: true,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 20),
              child: ListTile(
                title: Text(
                  '''Shewrapara, Mirpur, Dhaka-1216
House no: 938
Road no: 9''',
                  style: TextStyle(fontSize: 17),
                ),
                trailing: Radio(
                  value: 2,
                  groupValue: val,
                  onChanged: (value) {
                    setState(() {
                      val = value;
                      print(val);
                    });
                  },
                  activeColor: Colors.blue,
                  toggleable: true,
                ),
              ),
            ),
            Spacer(),
            Padding(
              padding: EdgeInsets.only(left: 24, right: 24, bottom: 10),
              child: Column(
                children: [
                  FDottedLine(
                    dottedLength: 2.0,
                    color: Colors.blue,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        decoration: BoxDecoration(),
                        width: double.infinity,
                        height: 50,
                        // ignore: deprecated_member_use
                        child: FlatButton(
                          onPressed: () {
                            // Navigator.push(context, MaterialPageRoute(builder: (context) {
                            //   return LoginScreen();
                            // }));
                          },
                          child: Text(
                            'Add Address',
                            style: TextStyle(
                                color: Color(0xff667EEA),
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
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
                          'Continue To Checkout',
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
          ],
        ),
      ),
    );
  }
}
