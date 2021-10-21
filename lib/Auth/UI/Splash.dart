import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application_2/Auth/UI/Auth.dart';
import 'package:flutter_application_2/Auth/provider/auth_provider.dart';
import 'dart:math' as math;

import 'package:flutter_application_2/home/UI/Home.dart';
import 'package:provider/provider.dart';

class SplachScreen extends StatefulWidget {
  static final String routeName = 'splash';

  @override
  _SplachScreenState createState() => _SplachScreenState();
}

class _SplachScreenState extends State<SplachScreen>
    with TickerProviderStateMixin {
  AnimationController animController;
  Animation<double> animation;

  startTimer() async {
    var _duration = Duration(seconds: 8);
    return Timer(_duration, navigateToLogin);
  }

  void navigateToLogin() {
    Provider.of<AuthProvider>(context, listen: false).checkLogin();

    // Navigator.pushReplacement(
    //     context, MaterialPageRoute(builder: (context) => AuthMainScreen()));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    animController = AnimationController(
        vsync: this,
        duration: Duration(
          seconds: 3,
        ));
    CurvedAnimation curvedAnimation = CurvedAnimation(
        parent: animController,
        curve: Curves.bounceIn,
        reverseCurve: Curves.easeInCubic);
    animation =
        Tween<double>(begin: 0, end: 2 * math.pi).animate(curvedAnimation)
          ..addListener(() {
            setState(() {});
          })
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              animController.reverse();
            } else if (status == AnimationStatus.forward) {
              animController.forward();
            }
          });
    animController.forward();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/back.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Transform.rotate(
                angle: animation.value,
                child: Container(
                  alignment: Alignment.center,
                  child: Image(
                    image: AssetImage('assets/images/icon.png'),
                  ),
                )),
            SizedBox(
              height: 50,
            ),
            Text(
              'Market Name',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    animController.dispose();
    super.dispose();
  }
}
