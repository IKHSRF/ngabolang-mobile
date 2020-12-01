import 'package:flutter/material.dart';

class MapsFab extends StatelessWidget {
  final Function onPressed;
  final Widget btnIcon;

  MapsFab({@required this.onPressed, @required this.btnIcon});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      child: btnIcon,
      backgroundColor: Colors.white,
      heroTag: null,
    );
  }
}
