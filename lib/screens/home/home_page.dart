import 'package:flutter/material.dart';
import '../../widgets/bottom_nav_bar.dart';
import 'local_widget/post_view.dart';
import 'local_widget/top_nav_bar.dart';

class HomePage extends StatefulWidget {
  static final String id = 'home_page';
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(screenSize.height / 11.0),
        child: TopNavBar(),
      ),
      body: PostView(),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
