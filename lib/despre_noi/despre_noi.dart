import 'package:derzelas/const/colors.dart';
import 'package:derzelas/logic/responsive.dart';
import 'package:flutter/material.dart';
import 'package:derzelas/general_widgets/search.dart';
import '../general_widgets/categories.dart';
import '../general_widgets/recent_posts.dart';

class DespreNoi extends StatelessWidget {
  const DespreNoi({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 2,
          child: Container(child: Text('Despre Noi')),
        ),
        if (!Responsive.isMobile(context))
          SizedBox(
            width: largePadding,
          ),
        if (!Responsive.isMobile(context))
          Expanded(
            child: Column(
              children: [
                Search(),
                SizedBox(height: largePadding),
                Categories(),
                SizedBox(height: largePadding),
                RecentPosts(),
              ],
            ),
          ),
      ],
    );
  }
}
