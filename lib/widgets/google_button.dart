import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GoogleButton extends StatelessWidget {
  const GoogleButton({
    Key key,
    @required this.screenSize,
    @required this.buttonText,
    @required this.buttonTap,
  }) : super(key: key);

  final Size screenSize;
  final Function buttonTap;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: buttonTap, //function that run when user tap
      child: Container(
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/icons/Google.svg', //icon of google
              height: screenSize.height / 30,
            ),
            SizedBox(width: 20.0),
            Text(
              buttonText, //button text, example login with google or register with google
              style: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }
}
