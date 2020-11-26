import 'package:flutter/material.dart';

class PostAccountDetail extends StatefulWidget {
  const PostAccountDetail({
    Key key,
    @required this.userPhotoURL,
    @required this.snapshot,
  }) : super(key: key);

  final String userPhotoURL;
  final snapshot;

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
            child: widget.userPhotoURL == null
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
                  widget.snapshot.data['displayName'],
                ),
                Text(
                  widget.snapshot.data['location'],
                ),
              ],
            ),
          ),
          Spacer(),
          IconButton(
            icon: Icon(isFavorite ? Icons.favorite : Icons.favorite_border_outlined),
            iconSize: 35.0,
            color: isFavorite ? Colors.red : Colors.black,
            onPressed: () {
              isFavorite = !isFavorite;
            },
          ),
        ],
      ),
    );
  }
}
