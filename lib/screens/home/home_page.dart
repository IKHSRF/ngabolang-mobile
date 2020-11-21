import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ngabolang/screens/authentication/login_page.dart';
import 'package:ngabolang/services/firebase_auth.dart';

class HomePage extends StatefulWidget {
  static final String id = 'home_page';
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(FirebaseAuth.instance.currentUser.displayName),
            RaisedButton(
              onPressed: () {
                AuthServices.signOut();
                Get.offAllNamed(LoginPage.id);
              },
            )
          ],
        ),
      ),
    );
  }
}
