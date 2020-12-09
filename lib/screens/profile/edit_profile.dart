import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:io';
import 'package:ngabolang/widgets/blue_button.dart';
import 'package:ngabolang/widgets/post_field.dart';
import 'package:ngabolang/widgets/user_image_picker.dart';
import 'package:ngabolang/services/firebase_storage.dart';
import 'package:ngabolang/services/firebase_auth.dart';

class EditProfile extends StatefulWidget {
  static String id = 'edit_profile';
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  User _user = FirebaseAuth.instance.currentUser;
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
    email = _user.email;
    imageUrl = _user.photoURL;

    nameController.text = name;
    emailController.text = email;
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            UserImagePicker(
              screenSize: screenSize,
              imageUrl: imageUrl,
              buttonTap: () async {
                File file = await StorageServices.getImage();
                imageUrl = await StorageServices.uploadPhoto(
                    file, FirebaseAuth.instance.currentUser.uid);
                setState(() {});
              },
            ),
            PostField(
              controller: emailController,
              hintText: 'Email',
              screenSize: screenSize,
            ),
            PostField(
              controller: nameController,
              hintText: 'Full Name',
              screenSize: screenSize,
            ),
            BlueButton(
              screenSize: screenSize,
              buttonTap: () async {
                var result =
                    await AuthServices.editUserProfile(name, email, imageUrl);

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
    );
  }
}
