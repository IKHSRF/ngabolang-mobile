import 'package:flutter/material.dart';
import 'package:ngabolang/constant/color.dart';

class DarkButton extends StatelessWidget {
  const DarkButton({
    Key key,
    @required this.screenSize,
    @required this.buttonText,
    @required this.buttonTap,
  }) : super(key: key);

  final Size screenSize;
  final String buttonText;
  final Function buttonTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: buttonTap, //function that run when user tap
      child: Container(
        alignment: Alignment.center,
        width: screenSize.width,
        height: screenSize.height / 15,
        decoration: BoxDecoration(
          color: buttonDarkColor,
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Text(
          buttonText, //button text, example login or create account
          style: TextStyle(
            color: Colors.white,
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
