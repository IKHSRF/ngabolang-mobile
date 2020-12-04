import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ngabolang/services/masonry_grid_post.dart';

class PostView extends StatelessWidget {
  const PostView({
    Key key,
    @required this.searchText,
  }) : super(key: key);
  final searchText;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: (searchText.isNotEmpty) ? FirebaseFirestore.instance.collection('posts').where('location', whereIn: searchText).snapshots() : FirebaseFirestore.instance.collection('posts').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        return MasonryGridPost(
          snapshot: snapshot,
          margin: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0),
        );
      },
    );
  }
}
