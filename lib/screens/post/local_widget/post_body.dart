import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';

class PostBody extends StatelessWidget {
  const PostBody({
    Key key,
    @required this.snapshot,
  }) : super(key: key);
  final snapshot;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //this for date
          Container(
            padding: EdgeInsets.only(bottom: 10.0),
            child: Text(Jiffy(snapshot.data['date'].toDate()).yMMMMd),
          ),
          //this for location
          Container(
            padding: EdgeInsets.only(bottom: 10.0),
            child: Text(snapshot.data['location']),
          ),
          //this is for image
          Container(
            padding: EdgeInsets.only(top: 10.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: Image.network(snapshot.data['url']),
            ),
          ),
        ],
      ),
    );
  }
}
