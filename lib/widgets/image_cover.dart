import 'package:flutter/material.dart';

class ImageCover extends StatelessWidget {
  const ImageCover({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/Start.jpg'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
