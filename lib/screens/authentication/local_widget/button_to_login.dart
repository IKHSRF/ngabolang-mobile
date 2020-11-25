import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ngabolang/constant/color.dart';

import '../login_page.dart';

class ButtonToLogin extends StatelessWidget {
  const ButtonToLogin({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Already have an account?'),
          GestureDetector(
            onTap: () {
              Get.toNamed(LoginPage.id);
            },
            child: Container(
              padding: EdgeInsets.only(left: 7.0),
              child: Text(
                'Log in',
                style: TextStyle(
                  color: buttonBlueColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
