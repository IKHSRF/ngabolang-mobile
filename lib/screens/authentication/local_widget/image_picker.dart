import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ImagePicker extends StatelessWidget {
  const ImagePicker({
    Key key,
    @required this.screenSize,
  }) : super(key: key);

  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.snackbar(
          'Mohon Maaf',
          'Fitur ini belum tersedia',
          colorText: Colors.white,
          backgroundColor: Colors.red,
        );
      },
      child: Container(
        alignment: Alignment.center,
        width: screenSize.width / 2,
        height: screenSize.height / 3,
        decoration: BoxDecoration(
          color: Color(0xFFD8D8D8),
          shape: BoxShape.circle,
        ),
        child: Icon(
          Icons.person_outline,
          size: screenSize.width / 3,
        ),
      ),
    );
  }
}
