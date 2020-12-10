import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'stats_row.dart';
import 'package:get/get.dart';
import 'edit_button.dart';
import '../edit_profile.dart';
import 'package:ngabolang/services/masonry_grid_post.dart';

class UserPostList extends StatelessWidget {
  final String uid;
  final String photoUrl;
  final int userPostCount;
  final int userFavoritesCount;
  final String name;
  final String email;

  UserPostList({
    @required this.uid,
    @required this.photoUrl,
    @required this.userPostCount,
    @required this.userFavoritesCount,
    @required this.name,
    @required this.email,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('posts')
          .where('uid', isEqualTo: uid)
          .snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage(photoUrl),
                    ),
                    SizedBox(
                      width: 80,
                    ),
                    StatsRow(
                        postsCount: userPostCount,
                        favoritesCount: userFavoritesCount),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  name,
                  style: TextStyle(fontSize: 22),
                ),
                Text(
                  email,
                  style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                ),
                SizedBox(
                  height: 10,
                ),
                EditButton(
                  onButtonTap: () {
                    Get.toNamed(EditProfile.id);
                  },
                ),
                SizedBox(
                  height: 15,
                ),
                Flexible(
                  child: MasonryGridPost(
                    snapshot: snapshot,
                    margin: EdgeInsets.all(0),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
