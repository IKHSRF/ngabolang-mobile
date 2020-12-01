import 'package:flutter/material.dart';

class StatsRow extends StatelessWidget {
  final int postsCount;
  final int favoritesCount;

  StatsRow({@required this.postsCount, @required this.favoritesCount});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: [
            Text(
              postsCount.toString(),
              style: TextStyle(fontSize: 22),
            ),
            Text(
              'Posts',
              style: TextStyle(fontSize: 14),
            ),
          ],
        ),
        SizedBox(width: 50),
        Column(
          children: [
            Text(
              favoritesCount.toString(),
              style: TextStyle(fontSize: 22),
            ),
            Text(
              'Favorites',
              style: TextStyle(fontSize: 14),
            ),
          ],
        ),
      ],
    );
  }
}
