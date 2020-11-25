import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ngabolang/screens/authentication/login_page.dart';
import 'package:ngabolang/screens/authentication/register_page.dart';
import 'package:ngabolang/widgets/blue_button.dart';
import 'package:ngabolang/widgets/dark_button.dart';

class BottomButton extends StatelessWidget {
  const BottomButton({
    Key key,
    @required this.screenSize,
  }) : super(key: key);

  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: screenSize.height / 25.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          BlueButton(
            screenSize: screenSize,
            buttonTap: () {
              Get.toNamed(LoginPage.id);
            },
            buttonText: 'Log In',
          ),
          SizedBox(
            height: screenSize.height / 50.0,
          ),
          DarkButton(
            screenSize: screenSize,
            buttonText: 'Create account',
            buttonTap: () {
              Get.toNamed(RegisterPage.id);
            },
          ),
        ],
      ),
    );
  }
}
