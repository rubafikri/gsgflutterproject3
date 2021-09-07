import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
  String label;
  TextEditingController controller;
  CustomTextfield(this.label, this.controller);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.only(right: 20, left: 20),
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: TextField(
        controller: this.controller,
        decoration: InputDecoration(
            filled: true,
            hoverColor: Colors.black,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(color: Color(0xffFA4C60)),
            ),
            labelText: this.label,
            labelStyle: TextStyle(color: Colors.white),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(color: Color(0xffFA4C60)),
            ),
            fillColor: Colors.grey.withOpacity(0.2)),
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
