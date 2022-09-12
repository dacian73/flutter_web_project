import 'package:derzelas/homePage/const/colors.dart';
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
        color: alb,
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
              color: negru,
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
