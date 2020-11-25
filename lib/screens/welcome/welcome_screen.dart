import 'package:flutter/material.dart';
import 'package:ngabolang/widgets/background_image.dart';

import 'local_widget/bottom_button.dart';

class WelcomePage extends StatelessWidget {
  static final String id = 'welcome_page';
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            ImageCover(
              image: 'assets/images/Start2.png',
              width: screenSize.width,
              height: screenSize.height,
            ),
            BottomButton(screenSize: screenSize),
          ],
        ),
      ),
    );
  }
}
