import 'package:flutter/material.dart';

class ProfileAppBar extends StatelessWidget {
  final Function onIconTap;

  ProfileAppBar({@required this.onIconTap});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: null,
      title: Text(
        'Profile',
        style: TextStyle(color: Colors.black87),
      ),
      actions: [
        IconButton(
          icon: Icon(
            Icons.login,
            color: Colors.grey[700],
          ),
          tooltip: 'Sign Out',
          onPressed: onIconTap,
        ),
      ],
      backgroundColor: Colors.white,
      automaticallyImplyLeading: false,
    );
  }
}
