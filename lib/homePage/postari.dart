import 'package:derzelas/homePage/colors.dart';
import 'package:derzelas/homePage/post_card.dart';
import 'package:derzelas/logic/responsive.dart';
import 'package:flutter/material.dart';
import 'package:derzelas/homePage/elements/search.dart';

import '../postari/postari_data.dart';
import 'elements/categories.dart';
import 'elements/recent_posts.dart';

class Postari extends StatelessWidget {
  const Postari({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 2,
          child: Container(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: postari.length,
              itemBuilder: (context, index) {
                return PostCard(
                    postari[index][0], postari[index][1], postari[index][2]);
              },
            ),
          ),
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
