import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  final String hintText;

  SearchField({@required this.hintText});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 250,
      padding: EdgeInsets.symmetric(
        vertical: 8.0,
        horizontal: 16.0,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(30),
      ),
      child: TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintText,
          hintStyle: TextStyle(fontSize: 15),
        ),
      ),
    );
  }
}
