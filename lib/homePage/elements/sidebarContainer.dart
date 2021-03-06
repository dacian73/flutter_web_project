import 'package:derzelas/homePage/colors.dart';
import 'package:flutter/material.dart';

class SidebarContainer extends StatelessWidget {
  final String title;
  final Widget child;
  const SidebarContainer({
    Key key,
    @required this.title,
    @required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(largePadding),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(smallPadding),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              color: Colors.black54,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: smallPadding), //10
          child,
        ],
      ),
    );
  }
}