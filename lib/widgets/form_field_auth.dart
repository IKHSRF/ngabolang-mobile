import 'package:flutter/material.dart';

class FormFieldAuth extends StatelessWidget {
  const FormFieldAuth({
    Key key,
    @required this.text,
    @required this.fieldController,
    @required this.isPassword,
  }) : super(key: key);

  final String text;
  final TextEditingController fieldController;
  final bool isPassword;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
        border: Border.all(color: Colors.black),
      ),
      child: TextField(
        obscureText: (isPassword) ? true : false, //check for password field or not
        controller: fieldController, //field controller
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: text, //text for hint text
          hintStyle: TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
