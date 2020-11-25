import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

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
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            crossAxisCount: 2,
            itemCount: snapshot.data.docs.length,
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    snapshot.data.docs[index]['url'],
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
            staggeredTileBuilder: (index) {
              return StaggeredTile.count(1, index.isEven ? 1.2 : 1.0);
            },
          ),
        );
      },
    );
  }
}
