import 'package:flutter/material.dart';

class UploadPostPhoto extends StatelessWidget {
  const UploadPostPhoto({
    Key key,
    @required this.screenSize,
    @required this.buttonPress,
    @required this.imagePath,
  }) : super(key: key);

  final Size screenSize;
  final Function buttonPress;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: buttonPress,
      child: Container(
        width: screenSize.width,
        height: screenSize.height * .45,
        color: Color(0xFFD1D1D1),
        child: (imagePath != null)
            ? Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(imagePath),
                  ),
                ),
              )
            : Icon(
                Icons.camera_alt,
                size: screenSize.height * .20,
                color: Colors.black.withOpacity(0.35),
              ),
      ),
    );
  }
}
