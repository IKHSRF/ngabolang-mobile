import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:ngabolang/screens/post/detail_post.dart';

import 'local_widget/favorite_headline.dart';

class FavoritePage extends StatefulWidget {
  static final String id = 'favorite_page';
  @override
  _FavoritePageState createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0),
            child: Column(
              children: [
                FavoriteHeadline(),
                //list of favorite post
                StreamBuilder(
                  stream: FirebaseFirestore.instance.collection('users').doc(FirebaseAuth.instance.currentUser.uid).snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      var favoriteList = [];
                      snapshot.data['favorites'].forEach((document) {
                        favoriteList.add(document);
                      });
                      return Container(
                        height: screenSize.height * 0.8,
                        child: StaggeredGridView.countBuilder(
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          crossAxisCount: 2,
                          itemCount: favoriteList.length,
                          itemBuilder: (context, index) {
                            return FutureBuilder(
                              future: FirebaseFirestore.instance.collection('posts').doc(favoriteList[index]).get(),
                              builder: (context, snapshot) {
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: CircularProgressIndicator(),
                                  );
                                }
                                return GestureDetector(
                                  onTap: () => Get.toNamed(
                                    DetailPost.id,
                                    arguments: snapshot.data.id,
                                  ),
                                  child: Container(
                                    padding: EdgeInsets.all(4.0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(15),
                                      child: Image.network(
                                        snapshot.data['url'],
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                          staggeredTileBuilder: (index) {
                            return StaggeredTile.fit(1);
                          },
                        ),
                      );
                    }
                    return Center(
                      child: CircularProgressIndicator(),
                    );
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
