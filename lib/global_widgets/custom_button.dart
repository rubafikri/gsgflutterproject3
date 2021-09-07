import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  Function function;
  String label;
  int color;
  CustomButton(this.function, this.label, this.color);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: 60,
      width: double.infinity,
      padding: EdgeInsets.only(left: 30, right: 30),
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: RaisedButton(
        color: Color(color),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        onPressed: () {
          function();
        },
        child: Text(
          label,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
