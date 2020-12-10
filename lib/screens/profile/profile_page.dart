import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ngabolang/screens/profile/local_widget/profile_appbar.dart';
import 'package:ngabolang/screens/profile/local_widget/user_postlist.dart';
import 'package:ngabolang/services/firebase_auth.dart';
import 'package:ngabolang/widgets/bottom_nav_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ngabolang/screens/welcome/get_started_screen.dart';

class ProfilePage extends StatefulWidget {
  static final String id = 'profile_page';

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final User _user = FirebaseAuth.instance.currentUser;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  String uid;

  void getUserData() async {
    uid = _user.uid;
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
        child: ProfileAppBar(
          onIconTap: () async {
            await AuthServices.signOut();
            Get.offAllNamed(GetStartedPage.id);
          },
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
      body: StreamBuilder(
        stream: _firestore
            .collection('users')
            .where('uid', isEqualTo: uid)
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          QueryDocumentSnapshot userData = snapshot.data.docs[0];
          return UserPostList(
            uid: uid,
            photoUrl: userData['photoURL'],
            userPostCount: userData['posts'],
            userFavoritesCount: userData['favorites'].length,
            name: userData['displayName'],
            email: userData['email'],
          );
        },
      ),
    );
  }
}
