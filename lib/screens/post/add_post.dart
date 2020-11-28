import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              UploadPostPhoto(
                screenSize: screenSize,
                imagePath: imagePath,
                buttonPress: () async {
                  File file = await StorageServices.getImage();
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
                    Get.snackbar('Oops Something when wrong', 'location Cannot Empty', colorText: Colors.white, backgroundColor: Colors.red);
                  } else if (imagePath.isNull) {
                    Get.snackbar('Oops Something when wrong', 'Image Cannot Empty', colorText: Colors.white, backgroundColor: Colors.red);
                  } else {
                    var result = await DatabaseServices.addPost(
                      Timestamp.fromDate(DateTime.now()),
                      locationController.text,
                      FirebaseAuth.instance.currentUser.uid,
                      imagePath,
                    );
                    if (result != 'berhasil') {
                      Get.snackbar('Opps Something when wrong', result, colorText: Colors.white, backgroundColor: Colors.red);
                    } else {
                      Get.offNamed(HomePage.id);
                    }
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
