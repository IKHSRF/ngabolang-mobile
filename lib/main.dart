import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ngabolang/screens/authentication/login_page.dart';
import 'package:ngabolang/screens/authentication/register_page.dart';
import 'package:ngabolang/screens/authentication/upload_user_photo.dart';
import 'package:ngabolang/screens/home/home_page.dart';
import 'package:ngabolang/screens/maps/maps_screen.dart';
import 'package:ngabolang/screens/post/detail_post.dart';
import 'package:ngabolang/screens/welcome/get_started_screen.dart';
import 'package:ngabolang/screens/welcome/welcome_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomePage.id,
      getPages: [
        GetPage(
          name: GetStartedPage.id,
          page: () => GetStartedPage(),
        ),
        GetPage(
          name: WelcomePage.id,
          page: () => WelcomePage(),
        ),
        GetPage(
          name: LoginPage.id,
          page: () => LoginPage(),
        ),
        GetPage(
          name: RegisterPage.id,
          page: () => RegisterPage(),
        ),
        GetPage(
          name: UserPhoto.id,
          page: () => UserPhoto(),
        ),
        GetPage(
          name: HomePage.id,
          page: () => HomePage(),
        ),
        GetPage(
          name: MapsScreen.id,
          page: () => MapsScreen(),
        ),
        GetPage(
          name: DetailPost.id,
          page: () => DetailPost(),
        ),
      ],
    );
  }
}
