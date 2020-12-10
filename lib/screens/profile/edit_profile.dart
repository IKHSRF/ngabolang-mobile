import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ngabolang/services/field_validator.dart';
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
  String nameValidate;

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
    nameValidate = Validator.nameValidate(nameController.text.trim());

    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: showLoading,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 36.0),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 48.0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                    onPressed: () => Get.back(),
                    icon: Icon(Icons.arrow_back_ios_outlined),
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ProfileImagePicker(
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

                      if (nameValidate != null) {
                        setState(() {
                          showLoading = !showLoading;
                        });
                        Get.snackbar('Enter your name correctly', nameValidate,
                            backgroundColor: Colors.red,
                            colorText: Colors.white);
                      } else {
                        var result = await AuthServices.editUserProfile(
                            nameController.text.trim(), imageUrl);

                        setState(() {
                          showLoading = !showLoading;
                        });

                        if (result != 'success') {
                          Get.snackbar('Opps Something went wrong', result,
                              colorText: Colors.white,
                              backgroundColor: Colors.red);
                        } else {
                          Get.back();
                        }
                      }
                    },
                    buttonText: 'Edit',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
