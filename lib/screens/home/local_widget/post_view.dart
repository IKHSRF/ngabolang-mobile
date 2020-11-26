import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:ngabolang/screens/post/detail_post.dart';

class PostView extends StatelessWidget {
  const PostView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('posts').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        return Container(
          margin: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0),
          child: StaggeredGridView.countBuilder(
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            crossAxisCount: 2,
            itemCount: snapshot.data.docs.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () => Get.toNamed(
                  DetailPost.id,
                  arguments: snapshot.data.docs[index].id,
                ),
                child: Container(
                  padding: EdgeInsets.all(4.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.network(
                      snapshot.data.docs[index]['url'],
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              );
            },
            staggeredTileBuilder: (index) {
              return StaggeredTile.fit(1);
            },
          ),
        );
      },
    );
  }
}
