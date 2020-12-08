import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:ngabolang/screens/post/detail_post.dart';
import 'package:cached_network_image/cached_network_image.dart';

class MasonryGridPost extends StatelessWidget {
  const MasonryGridPost({
    Key key,
    @required this.snapshot,
    @required this.margin,
  }) : super(key: key);
  final snapshot;
  final EdgeInsetsGeometry margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
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
                  child: CachedNetworkImage(
                    imageUrl: snapshot.data.docs[index]['thumbUrl'],
                    placeholder: (context, url) =>
                        Center(child: CircularProgressIndicator()),
                    fit: BoxFit.cover,
                  )),
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
