import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:ngabolang/screens/post/detail_post.dart';

class MasonryGridPost extends StatelessWidget {
  const MasonryGridPost({
    Key key,
    @required this.snapshot,
    @required this.isFavorite,
  }) : super(key: key);
  final snapshot;
  final isFavorite;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0),
      child: StaggeredGridView.countBuilder(
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: 2,
        itemCount: (isFavorite) ? snapshot.data.length : snapshot.data.docs.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => Get.toNamed(
              DetailPost.id,
              arguments: (isFavorite) ? snapshot.data.id : snapshot.data.docs[index].id,
            ),
            child: Container(
              padding: EdgeInsets.all(4.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(
                  (isFavorite) ? snapshot.data['url'] : snapshot.data.docs[index]['url'],
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
  }
}
