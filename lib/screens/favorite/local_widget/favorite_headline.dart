import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavoriteHeadline extends StatelessWidget {
  const FavoriteHeadline({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        IconButton(
          icon: Icon(Icons.arrow_back_ios_outlined),
          onPressed: () => Get.back(),
        ),
        SizedBox(width: 10.0),
        Text(
          'Your Favourite List',
          style: TextStyle(fontSize: 30),
        ),
      ],
    );
  }
}
