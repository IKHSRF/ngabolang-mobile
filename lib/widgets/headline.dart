import 'package:flutter/material.dart';
import 'package:ngabolang/widgets/google_button.dart';

class Headline extends StatelessWidget {
  const Headline({
    Key key,
    @required this.screenSize,
    @required this.buttonTap,
    @required this.textHeadline,
    @required this.buttonText,
  }) : super(key: key);

  final Size screenSize;
  final Function buttonTap;
  final String textHeadline;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      runSpacing: screenSize.height / 30,
      children: [
        Container(
          alignment: Alignment.center,
          child: Text(
            textHeadline, //text headline, example Log In or Create Account
            style: TextStyle(fontSize: 28),
          ),
        ),

        //Google button for llogin with google or register with google
        GoogleButton(
          screenSize: screenSize, //screen size for screensize
          buttonText: buttonText, //button text for text in button
          buttonTap: buttonTap, //button tap function button tap is executed when the user tap
        ),
      ],
    );
  }
}
