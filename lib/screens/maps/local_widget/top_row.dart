import 'package:flutter/material.dart';
import 'search_field.dart';
import 'maps_fab.dart';
import 'package:get/get.dart';

class TopRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(top: 16.0),
        child: Row(
          children: [
            SizedBox(
              width: 16,
            ),
            MapsFab(
              onPressed: () => Get.back(),
              btnIcon: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Icon(Icons.arrow_back_ios, color: Colors.black),
              ),
            ),
            SizedBox(
              width: 16,
            ),
            SearchField(
              hintText: 'Search a place',
            ),
          ],
        ),
      ),
    );
  }
}
