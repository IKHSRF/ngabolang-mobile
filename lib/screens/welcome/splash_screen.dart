import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:ngabolang/screens/home/home_page.dart';
import 'get_started_screen.dart';

class SplashScreen extends StatefulWidget {
  static String id = 'splash_screen';
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
    checkLoggedInUser();
  }

  void checkLoggedInUser() {
    var user = _auth.currentUser;
    if (user != null) {
      Future.delayed(Duration(seconds: 3), () {
        Get.offAllNamed(HomePage.id);
      });
    } else {
      Future.delayed(Duration(seconds: 3), () {
        Get.offAllNamed(GetStartedPage.id);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/icons/globe.png',
          width: screenSize.width / 4,
          height: screenSize.height / 7,
        ),
      ),
    );
  }
}
