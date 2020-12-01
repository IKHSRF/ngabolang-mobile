import 'package:flutter/material.dart';
import 'local_widget/bottom_nav_bar.dart';
import 'local_widget/post_view.dart';
import 'local_widget/top_nav_bar.dart';

class HomePage extends StatefulWidget {
  static final String id = 'home_page';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController searchController = TextEditingController();
  List<String> keyword = [];
  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(screenSize.height / 11.0),
        child: TopNavBar(
          searchController: searchController,
          addKeyword: (value) {
            keyword.add(value.toUpperCase());
            searchController.clear();
          },
        ),
      ),
      body: Stack(
        children: [
          PostView(
            searchText: keyword,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: (keyword.isEmpty)
                ? Container()
                : Row(
                    children: keyword.map((searchWord) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Chip(
                          label: Text(searchWord.toLowerCase()),
                          backgroundColor: Colors.blue,
                          labelStyle: TextStyle(color: Colors.white),
                          deleteIcon: Icon(
                            Icons.cancel_rounded,
                            color: Colors.white,
                          ),
                          onDeleted: () {
                            searchController.clear();
                            setState(() {
                              keyword.remove(searchWord);
                            });
                          },
                        ),
                      );
                    }).toList(),
                  ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
