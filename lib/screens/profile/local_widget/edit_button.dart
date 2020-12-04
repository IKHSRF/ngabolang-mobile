import 'package:flutter/material.dart';

class EditButton extends StatelessWidget {
  final Function onButtonTap;

  EditButton({@required this.onButtonTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onButtonTap,
      child: Container(
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Center(
            child: Text(
          'Edit Profile',
          style: TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.bold,
          ),
        )),
      ),
    );
  }
}
