import 'package:flutter/material.dart';

class ImageCover extends StatelessWidget {
  const ImageCover({
    Key key,
    @required this.image,
    @required this.width,
    @required this.height,
  }) : super(key: key);

  final image;
  final width;
  final height;

  @override
  Widget build(BuildContext context) {
    //background image container
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
