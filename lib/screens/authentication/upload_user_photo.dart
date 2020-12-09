import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:ngabolang/screens/home/home_page.dart';
import 'package:ngabolang/services/firebase_auth.dart';
import 'package:ngabolang/services/firebase_storage.dart';
import 'package:ngabolang/widgets/dark_button.dart';

import '../../widgets/user_image_picker.dart';

class UserPhoto extends StatefulWidget {
  static final String id = 'user_photo';
  @override
  _UserPhotoState createState() => _UserPhotoState();
}

class _UserPhotoState extends State<UserPhoto> {
  String imagePath;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: isLoading,
        child: Container(
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
              UserImagePicker(
                screenSize: screenSize,
                imageUrl: imagePath,
                buttonTap: () async {
                  File file = await StorageServices.getImage();
                  imagePath = await StorageServices.uploadPhoto(
                      file, FirebaseAuth.instance.currentUser.uid);
                  setState(() {});
                },
              ),
              DarkButton(
                screenSize: screenSize,
                buttonText: 'Next',
                buttonTap: () async {
                  setState(() {
                    isLoading = true;
                  });
                  String result = await AuthServices.addProfilePhoto(imagePath);
                  setState(() {
                    isLoading = false;
                  });
                  if (result != 'berhasil') {
                    Get.snackbar(
                      'oops something went wrong',
                      result,
                      colorText: Colors.white,
                      backgroundColor: Colors.red,
                    );
                  } else {
                    Get.offAllNamed(HomePage.id);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
