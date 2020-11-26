import 'package:flutter/material.dart';

class TopRow extends StatelessWidget {
  final List<Widget> widgetList;

  TopRow({@required this.widgetList});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(top: 16.0),
        child: Row(
          children: widgetList,
        ),
      ),
    );
  }
}
