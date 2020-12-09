import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ngabolang/services/firebase_firestore.dart';

class PostAccountDetail extends StatefulWidget {
  const PostAccountDetail({
    Key key,
    @required this.userPhotoURL,
    @required this.userName,
    @required this.snapshot,
    @required this.userFavorite,
  }) : super(key: key);

  final String userPhotoURL;
  final String userName;
  final snapshot;
  final userFavorite;

  @override
  _PostAccountDetailState createState() => _PostAccountDetailState();
}

class _PostAccountDetailState extends State<PostAccountDetail> {
  var isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15.0),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.only(top: 10.0, right: 15.0),
            child: widget.userPhotoURL ==
                    null //if user profile photo still load, show progress indicator, else show profile photo
                ? CircularProgressIndicator()
                : Container(
                    width: 48.0,
                    height: 48.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: NetworkImage(widget.userPhotoURL),
                      ),
                    ),
                  ),
          ),
          Container(
            padding: EdgeInsets.only(top: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.userName,
                ),
              ],
            ),
          ),
          Spacer(),
          FutureBuilder(
              future: FirebaseFirestore.instance
                  .collection('users')
                  .doc(FirebaseAuth.instance.currentUser.uid)
                  .get(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  //cara tau ini favorite atau bukan
                  var favoriteList = [];
                  snapshot.data['favorites'].forEach((e) {
                    favoriteList.add(e);
                  });
                  bool result = favoriteList.contains(widget.userFavorite);

                  if (result == true) {
                    isFavorite = true;
                  } else {
                    isFavorite = false;
                  }
                  return IconButton(
                    icon: Icon(isFavorite
                        ? Icons.favorite
                        : Icons.favorite_border_outlined),
                    iconSize: 25.0,
                    color: isFavorite ? Colors.red : Colors.black,
                    onPressed: () async {
                      if (isFavorite == false) {
                        var result = await DatabaseServices.addFavorite(
                            widget.snapshot.data.id,
                            FirebaseAuth.instance.currentUser.uid);
                        if (result != 'berhasil') {
                          Get.snackbar('Opps Something went wrong', result,
                              colorText: Colors.white,
                              backgroundColor: Colors.red);
                        } else {
                          isFavorite = true;
                        }
                      } else {
                        var result = await DatabaseServices.removeFavorite(
                            widget.snapshot.data.id,
                            FirebaseAuth.instance.currentUser.uid);
                        if (result != 'berhasil') {
                          Get.snackbar('Opps Something went wrong', result,
                              colorText: Colors.white,
                              backgroundColor: Colors.red);
                        } else {
                          isFavorite = false;
                        }
                      }
                    },
                  );
                }
                return CircularProgressIndicator();
              }),
        ],
      ),
    );
  }
}
