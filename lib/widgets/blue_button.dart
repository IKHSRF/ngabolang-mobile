import 'package:flutter/material.dart';
import 'package:ngabolang/constant/color.dart';

class BlueButton extends StatelessWidget {
  const BlueButton({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        alignment: Alignment.center,
        width: double.infinity,
        height: size.height / 15,
        decoration: BoxDecoration(
          color: buttonBlueColor,
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Text(
          'Get Started',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16.0,
          ),
        ),
      ),
    );
  }
}
