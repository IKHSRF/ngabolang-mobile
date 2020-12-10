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
    Size screenSize = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.only(top: 15.0),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.only(top: 10.0),
            child: widget.userPhotoURL == null //if user profile photo still load, show progress indicator, else show profile photo
                ? CircularProgressIndicator()
                : Container(
                    width: 48.0,
                    height: 48.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: NetworkImage(widget.userPhotoURL),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
          ),
          SizedBox(width: 10.0),
          Container(
            padding: EdgeInsets.only(top: 10.0),
            width: screenSize.width * 0.42,
            child: Text(
              widget.userName,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Spacer(),
          FutureBuilder(
              future: FirebaseFirestore.instance.collection('users').doc(FirebaseAuth.instance.currentUser.uid).get(),
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
                  return Row(
                    children: [
                      widget.snapshot.data['uid'] == FirebaseAuth.instance.currentUser.uid
                          ? IconButton(
                              icon: Icon(Icons.delete),
                              onPressed: () async {
                                Get.back();
                                var result = await DatabaseServices.removePost(widget.snapshot.data.id);
                                if (result != 'berhasil') {
                                  Get.snackbar('Opps Something went wrong', result, colorText: Colors.white, backgroundColor: Colors.red);
                                } else {
                                  Get.snackbar('Success', 'Post Deleted', colorText: Colors.white, backgroundColor: Colors.green);
                                }
                              },
                            )
                          : Container(),
                      IconButton(
                        icon: Icon(isFavorite ? Icons.favorite : Icons.favorite_border_outlined),
                        color: isFavorite ? Colors.red : Colors.black,
                        onPressed: () async {
                          if (isFavorite == false) {
                            var result = await DatabaseServices.addFavorite(widget.snapshot.data.id, FirebaseAuth.instance.currentUser.uid);
                            if (result != 'berhasil') {
                              Get.snackbar('Opps Something went wrong', result, colorText: Colors.white, backgroundColor: Colors.red);
                            } else {
                              isFavorite = true;
                            }
                          } else {
                            var result = await DatabaseServices.removeFavorite(widget.snapshot.data.id, FirebaseAuth.instance.currentUser.uid);
                            if (result != 'berhasil') {
                              Get.snackbar('Opps Something went wrong', result, colorText: Colors.white, backgroundColor: Colors.red);
                            } else {
                              isFavorite = false;
                            }
                          }
                        },
                      ),
                    ],
                  );
                }
                return CircularProgressIndicator();
              }),
        ],
      ),
    );
  }
}
