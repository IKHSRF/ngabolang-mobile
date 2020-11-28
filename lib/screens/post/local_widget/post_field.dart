import 'package:flutter/material.dart';

class PostField extends StatelessWidget {
  const PostField({
    Key key,
    @required this.controller,
    @required this.hintText,
    @required this.screenSize,
  }) : super(key: key);

  final TextEditingController controller;
  final String hintText;
  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: screenSize.height * 0.03),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
        ),
      ),
    );
  }
}
