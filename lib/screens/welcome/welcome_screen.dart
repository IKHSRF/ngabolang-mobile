import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ngabolang/screens/authentication/login_page.dart';
import 'package:ngabolang/screens/authentication/register_page.dart';
import 'package:ngabolang/widgets/background_image.dart';
import 'package:ngabolang/widgets/blue_button.dart';
import 'package:ngabolang/widgets/dark_button.dart';

class WelcomePage extends StatelessWidget {
  static final String id = 'welcome_page';
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            //background image for ngabolang welcome screen
            ImageCover(
              image: 'assets/images/Start2.jpg',
              height: screenSize.height / 1.35,
              width: screenSize.width,
            ),
            Container(
              padding: EdgeInsets.fromLTRB(40.0, screenSize.height / 15, 40.0, 0),
              child: Column(
                children: [
                  //login button
                  //screen size for screen size
                  //button text  for text in button
                  //button tap, function that run when user tap
                  BlueButton(
                    buttonText: 'Login',
                    screenSize: screenSize,
                    buttonTap: () {
                      Get.toNamed(LoginPage.id);
                    },
                  ),
                  SizedBox(height: screenSize.height / 40),
                  //create account button
                  //screen size for screen size
                  //button text  for text in button
                  //button tap, function that run when user tap
                  DarkButton(
                    screenSize: screenSize,
                    buttonText: 'Create account',
                    buttonTap: () {
                      Get.toNamed(RegisterPage.id);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
