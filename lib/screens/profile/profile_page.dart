import 'package:flutter/material.dart';
import 'package:ngabolang/screens/profile/local_widget/edit_button.dart';
import 'package:ngabolang/screens/profile/local_widget/profile_appbar.dart';
import 'package:ngabolang/screens/profile/local_widget/stats_row.dart';
import 'package:ngabolang/widgets/bottom_nav_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProfilePage extends StatefulWidget {
  static final String id = 'profile_page';

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String photoUrl;

  void getUserData() {
    photoUrl = _auth.currentUser.photoURL;
  }

  @override
  void initState() {
    super.initState();
    getUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(56),
        child: ProfileAppBar(),
      ),
      bottomNavigationBar: BottomNavBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(photoUrl),
                  ),
                  SizedBox(
                    width: 80,
                  ),
                  StatsRow(postsCount: 27, favoritesCount: 81),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                'John Doe',
                style: TextStyle(fontSize: 22),
              ),
              Text(
                'user@email.me',
                style: TextStyle(fontSize: 16, color: Colors.grey[600]),
              ),
              SizedBox(
                height: 10,
              ),
              EditButton(
                onButtonTap: () {}, // TODO: Add edit function
              ),
            ],
          ),
        ),
      ),
    );
  }
}
