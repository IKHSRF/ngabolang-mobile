import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ngabolang/screens/authentication/login_page.dart';
import 'package:ngabolang/screens/welcome/get_started_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: GetStartedPage.id,
      getPages: [
        GetPage(
          name: GetStartedPage.id,
          page: () => GetStartedPage(),
        ),
        GetPage(
          name: LoginPage.id,
          page: () => LoginPage(),
        ),
      ],
    );
  }
}
