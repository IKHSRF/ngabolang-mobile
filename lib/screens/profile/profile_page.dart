import 'package:flutter/material.dart';
import 'package:ngabolang/screens/profile/local_widget/profile_appbar.dart';
import 'package:ngabolang/widgets/bottom_nav_bar.dart';

class ProfilePage extends StatefulWidget {
  static final String id = 'profile_page';

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(56),
        child: ProfileAppBar(),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
