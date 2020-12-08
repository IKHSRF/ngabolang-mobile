import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ngabolang/screens/profile/local_widget/edit_button.dart';
import 'package:ngabolang/screens/profile/local_widget/profile_appbar.dart';
import 'package:ngabolang/screens/profile/local_widget/stats_row.dart';
import 'package:ngabolang/widgets/bottom_nav_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ngabolang/services/masonry_grid_post.dart';
import 'package:ngabolang/screens/welcome/get_started_screen.dart';

class ProfilePage extends StatefulWidget {
  static final String id = 'profile_page';

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final User _user = FirebaseAuth.instance.currentUser;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  String photoUrl = '';
  String uid;
  DocumentSnapshot user;
  int userPostCount = 0;
  List<dynamic> userFavorites;
  int userFavoritesCount = 0;
  String name = 'Name';
  String email = 'Email';

  void getUserData() async {
    uid = _user.uid;
    user = await _firestore.collection('users').doc(uid).get();
    setState(() {
      photoUrl = _user.photoURL;
      name = _user.displayName;
      email = _user.email;
      userPostCount = user.data()['posts'];
      userFavorites = user.data()['favorites'];
      userFavoritesCount = userFavorites.length;
    });
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
            await FirebaseAuth.instance.signOut();
            Get.offAllNamed(GetStartedPage.id);
          },
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('posts').where('uid', isEqualTo: uid).snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return SafeArea(
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
                      StatsRow(postsCount: userPostCount, favoritesCount: userFavoritesCount),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    name,
                    style: TextStyle(fontSize: 22),
                  ),
                  Text(
                    email,
                    style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  EditButton(
                    onButtonTap: () {}, // TODO: Add edit function
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Flexible(
                    child: MasonryGridPost(
                      snapshot: snapshot,
                      margin: EdgeInsets.all(0),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
