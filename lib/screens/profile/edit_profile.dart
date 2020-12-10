import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:io';
import 'package:ngabolang/widgets/blue_button.dart';
import 'package:ngabolang/widgets/post_field.dart';
import 'local_widget/profile_image_picker.dart';
import 'package:ngabolang/services/firebase_storage.dart';
import 'package:ngabolang/services/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class EditProfile extends StatefulWidget {
  static String id = 'edit_profile';
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  TextEditingController nameController = TextEditingController();
  User _user = FirebaseAuth.instance.currentUser;
  bool showLoading = false;
  String imageUrl;
  String name;
  String email;

  @override
  void initState() {
    super.initState();
    getUserData();
  }

  void getUserData() {
    name = _user.displayName;
    imageUrl = _user.photoURL;

    nameController.text = name;
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: showLoading,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 36.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ProfileImagePicker(
                screenSize: screenSize,
                imageUrl: imageUrl == _user.photoURL ? null : imageUrl,
                buttonTap: () async {
                  File file = await StorageServices.getImage();
                  imageUrl = await StorageServices.uploadPhoto(
                      file, FirebaseAuth.instance.currentUser.uid);
                  setState(() {});
                },
              ),
              PostField(
                controller: nameController,
                hintText: 'Full Name',
                margin: 0,
              ),
              SizedBox(
                height: 36,
              ),
              BlueButton(
                screenSize: screenSize,
                buttonTap: () async {
                  setState(() {
                    showLoading = !showLoading;
                  });
                  var result = await AuthServices.editUserProfile(
                      nameController.text.trim(), imageUrl);

                  setState(() {
                    showLoading = !showLoading;
                  });

                  if (result != 'berhasil') {
                    Get.snackbar('Opps Something went wrong', result,
                        colorText: Colors.white, backgroundColor: Colors.red);
                  } else {
                    Get.back();
                  }
                },
                buttonText: 'Edit',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
