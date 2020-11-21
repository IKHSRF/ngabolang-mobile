import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ngabolang/widgets/dark_button.dart';

import 'local_widget/image_picker.dart';

class UserPhoto extends StatefulWidget {
  static final String id = 'user_photo';
  @override
  _UserPhotoState createState() => _UserPhotoState();
}

class _UserPhotoState extends State<UserPhoto> {
  String imagePath;
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 40.0),
        child: Wrap(
          alignment: WrapAlignment.center,
          runSpacing: screenSize.height / 10,
          children: [
            Container(
              child: Text(
                'Now let’s upload \n  a photo of you',
                style: TextStyle(fontSize: 24.0),
              ),
            ),
            ImagePicker(screenSize: screenSize),
            DarkButton(
              screenSize: screenSize,
              buttonText: 'Next',
              buttonTap: () {
                Get.snackbar(
                  'Mohon Maaf',
                  'Fitur ini belum tersedia',
                  colorText: Colors.white,
                  backgroundColor: Colors.red,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
