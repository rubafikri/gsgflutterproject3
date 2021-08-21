import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  Function function;
  String label;
  CustomButton(this.function, this.label);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: 60,
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: RaisedButton(
        color: Colors.pink[300],
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        onPressed: () {
          function();
        },
        child: Text(
          label,
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
