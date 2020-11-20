import 'package:flutter/material.dart';
import 'package:ngabolang/widgets/app_logo.dart';
import 'package:ngabolang/widgets/blue_button.dart';
import 'package:ngabolang/widgets/image_cover.dart';

class GetStartedPage extends StatelessWidget {
  static final String id = 'get_started';
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          ImageCover(),
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: size.height / 15),
            decoration: BoxDecoration(
              color: Colors.black26,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AppLogo(size: size),
                BlueButton(size: size),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
