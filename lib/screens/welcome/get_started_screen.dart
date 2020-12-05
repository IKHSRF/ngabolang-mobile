import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ngabolang/screens/welcome/local_widget/app_logo.dart';
import 'package:ngabolang/widgets/blue_button.dart';
import 'package:ngabolang/widgets/background_image.dart';
import 'welcome_screen.dart';

class GetStartedPage extends StatelessWidget {
  static final String id = 'get_started';
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          //image background for ngabolang get started screen
          ImageCover(
            image: 'assets/images/Start.jpg',
            width: screenSize.width,
            height: screenSize.height,
          ),
          //dark layer for covering background
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(
                horizontal: 20.0, vertical: screenSize.height / 15),
            decoration: BoxDecoration(
              color: Colors.black26,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //app logo for ngabolang
                //title for ngabolang
                AppLogo(size: screenSize),
                //Get started button
                //screen size for screen size
                //button text  for text in button
                //button tap, function that run when user tap
                BlueButton(
                  buttonText: 'Get Started',
                  screenSize: screenSize,
                  buttonTap: () {
                    Get.toNamed(WelcomePage.id);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
