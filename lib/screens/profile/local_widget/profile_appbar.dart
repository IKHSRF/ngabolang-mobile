import 'package:flutter/material.dart';

class ProfileAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: null,
      title: Text(
        'Profile',
        style: TextStyle(color: Colors.black87),
      ),
      backgroundColor: Colors.white,
      automaticallyImplyLeading: false,
    );
  }
}
