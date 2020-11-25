import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TopNavBar extends StatelessWidget {
  const TopNavBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      title: Container(
        margin: EdgeInsets.only(top: 10.0, bottom: 5.0),
        child: TextField(
          readOnly: true,
          onTap: () {
            Get.snackbar('Sorry', 'search feature not yet available', colorText: Colors.white, backgroundColor: Colors.red);
          },
          decoration: InputDecoration(
            hintText: 'Search',
            prefixIcon: Icon(Icons.search),
          ),
        ),
      ),
      actions: [
        Container(
          margin: EdgeInsets.only(left: 10.0, top: 20.0),
          child: IconButton(
            icon: Icon(Icons.camera_alt_outlined),
            color: Colors.black,
            onPressed: () {
              Get.snackbar('Sorry', 'feature not yet available', colorText: Colors.white, backgroundColor: Colors.red);
            },
          ),
        ),
        Container(
          margin: EdgeInsets.only(right: 20.0, top: 20.0),
          child: IconButton(
            icon: Icon(Icons.favorite_border_outlined),
            color: Colors.black,
            onPressed: () {
              Get.snackbar('Sorry', 'feature not yet available', colorText: Colors.white, backgroundColor: Colors.red);
            },
          ),
        ),
      ],
    );
  }
}
