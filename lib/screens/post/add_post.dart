import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:ngabolang/screens/home/home_page.dart';
import 'package:ngabolang/services/firebase_firestore.dart';
import 'package:ngabolang/services/firebase_storage.dart';
import 'local_widget/add_post_field.dart';
import 'local_widget/upload_post_photo.dart';

class AddPost extends StatefulWidget {
  static final String id = 'add_post';
  @override
  _AddPostState createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
  final TextEditingController tagsController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  String imagePath;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: isLoading,
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                UploadPostPhoto(
                  screenSize: screenSize,
                  imagePath: imagePath,
                  buttonPress: () async {
                    File file = await StorageServices.getImage();
                    //upload image to storage
                    imagePath = await StorageServices.uploadPostImage(file);
                    setState(() {});
                  },
                ),
                SizedBox(height: screenSize.height * 0.05),
                AddPostField(
                  screenSize: screenSize,
                  tagsController: tagsController,
                  locationController: locationController,
                  buttonPostPress: () async {
                    if (locationController.text.trim().isEmpty) {
                      Get.snackbar('Oops Something went wrong', 'location Cannot Empty', colorText: Colors.white, backgroundColor: Colors.red);
                    } else if (imagePath.isNull) {
                      Get.snackbar('Oops Something went wrong', 'Image Cannot Empty', colorText: Colors.white, backgroundColor: Colors.red);
                    } else {
                      //upload image to firestore
                      var result = await DatabaseServices.addPost(
                        Timestamp.fromDate(DateTime.now()),
                        locationController.text.toUpperCase(),
                        FirebaseAuth.instance.currentUser.uid,
                        imagePath,
                      );
                      if (result != 'berhasil') {
                        Get.snackbar('Opps Something went wrong', result, colorText: Colors.white, backgroundColor: Colors.red);
                      } else {
                        setState(() {
                          isLoading = true;
                        });
                        await Future.delayed(Duration(seconds: 5));
                        Get.offNamed(HomePage.id);
                      }
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
