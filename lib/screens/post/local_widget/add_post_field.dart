import 'package:flutter/material.dart';
import 'package:ngabolang/widgets/blue_button.dart';

import 'post_field.dart';

class AddPostField extends StatelessWidget {
  const AddPostField({
    Key key,
    @required this.screenSize,
    @required this.locationController,
    @required this.tagsController,
    @required this.buttonPostPress,
  }) : super(key: key);

  final Size screenSize;
  final TextEditingController tagsController;
  final TextEditingController locationController;
  final Function buttonPostPress;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenSize.width,
      padding: EdgeInsets.symmetric(horizontal: 40.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          PostField(
            controller: locationController,
            hintText: 'Location',
            screenSize: screenSize,
          ),
          SizedBox(height: screenSize.height * 0.08),
          BlueButton(
            screenSize: screenSize,
            buttonTap: buttonPostPress,
            buttonText: 'Post',
          )
        ],
      ),
    );
  }
}
