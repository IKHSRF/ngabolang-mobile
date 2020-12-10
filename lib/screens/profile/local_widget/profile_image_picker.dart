import 'package:flutter/material.dart';

class ProfileImagePicker extends StatelessWidget {
  final Size screenSize;
  final String imageUrl;
  final Function buttonTap;

  ProfileImagePicker({
    @required this.screenSize,
    @required this.imageUrl,
    @required this.buttonTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: buttonTap,
      child: Container(
        alignment: Alignment.center,
        width: screenSize.width / 2,
        height: screenSize.height / 3,
        decoration: BoxDecoration(
          color: Color(0xFFD8D8D8),
          shape: BoxShape.circle,
        ),
        child: (imageUrl != null)
            ? Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(imageUrl),
                  ),
                ),
              )
            : Icon(
                Icons.person_outline,
                size: screenSize.width / 3,
              ),
      ),
    );
  }
}
