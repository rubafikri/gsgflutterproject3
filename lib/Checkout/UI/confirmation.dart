import 'package:flutter/material.dart';
import 'package:flutter_application_2/home/UI/Home.dart';

class ConfirmScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
          top: 203,
        ),
        child: Column(
          children: [
            Image.asset(
              'assets/images/like.png',
              width: 242,
              height: 242,
            ),
            Padding(
              padding: EdgeInsets.only(top: 71, bottom: 21),
              child: Text(
                'Confirmation',
                style: TextStyle(fontSize: 30),
              ),
            ),
            Text(
              '''You have successfully 
completed your payment procedure''',
              textAlign: TextAlign.center,
            ),
            Spacer(),
            Container(
              margin: EdgeInsets.only(left: 50, bottom: 24),
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
              height: 50,
              width: 326,
              // ignore: deprecated_member_use
              child: FlatButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return HomeScreen();
                  }));
                },
                child: Text(
                  'Back To Home',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
