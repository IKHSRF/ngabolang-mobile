import 'package:flutter/material.dart';

class PostField extends StatelessWidget {
  const PostField({
    Key key,
    @required this.controller,
    @required this.hintText,
    @required this.margin,
  }) : super(key: key);

  final TextEditingController controller;
  final String hintText;
  final double margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: margin),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
        ),
      ),
    );
  }
}
