import 'package:flutter/material.dart';

import 'local_widget/favorite_headline.dart';

class FavoritePage extends StatefulWidget {
  static final String id = 'favorite_page';
  @override
  _FavoritePageState createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                FavoriteHeadline(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
