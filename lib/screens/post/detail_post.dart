import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ngabolang/services/firebase_auth.dart';

import 'local_widget/post_account_detail.dart';
import 'local_widget/post_body.dart';

class DetailPost extends StatefulWidget {
  static final String id = 'detail_post';
  @override
  _DetailPostState createState() => _DetailPostState();
}

class _DetailPostState extends State<DetailPost> {
  String userPhotoURL;
  String userName = '';

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(
              horizontal: 35.0, vertical: screenSize.height / 20.0),
          child: FutureBuilder(
            future: FirebaseFirestore.instance
                .collection('posts')
                .doc(Get.arguments)
                .get(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                //check user exist or not
                FirebaseFirestore.instance
                    .collection('users')
                    .doc(snapshot.data['uid'])
                    .get()
                    .then(
                  (DocumentSnapshot documentSnapshot) {
                    if (documentSnapshot.exists) {
                      if (!mounted) return;
                      setState(() {
                        userPhotoURL = documentSnapshot.data()['photoURL'];
                        userName = documentSnapshot.data()['displayName'];
                      });
                    } else {
                      if (!mounted) return;
                      setState(() {
                        userPhotoURL = AuthServices.defaultPhoto;
                        userName = 'Deleted User';
                      });
                    }
                  },
                );
                return Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: IconButton(
                        onPressed: () => Get.back(),
                        icon: Icon(Icons.arrow_back_ios_outlined),
                      ),
                    ),
                    PostBody(
                      snapshot: snapshot,
                    ),
                    PostAccountDetail(
                      userPhotoURL: userPhotoURL,
                      userName: userName,
                      snapshot: snapshot,
                      //argument yang diberikan berupa document id
                      userFavorite: Get.arguments,
                    ),
                  ],
                );
              }
              //if data in snapshot not exists
              return Container(
                height: screenSize.height,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
