import 'package:derzelas/homePage/colors.dart';
import 'package:derzelas/homePage/post_card.dart';
import 'package:derzelas/logic/responsive.dart';
import 'package:flutter/material.dart';
import 'package:derzelas/homePage/elements/search.dart';

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
          child: Column(
              children: List.generate(
                  10,
                  (index) => PostCard(
                      'https://scontent.fomr1-1.fna.fbcdn.net/v/t39.30808-6/304937330_5621520481242183_8317536609528081791_n.jpg?stp=cp6_dst-jpg&_nc_cat=110&ccb=1-7&_nc_sid=8bfeb9&_nc_ohc=caPaLVts4U4AX_kmSLs&_nc_ht=scontent.fomr1-1.fna&oh=00_AT_bLZxtbgO8jR-80RmEsC63SSZdhbZj54cEpsuQgE7O-w&oe=63224246',
                      'text'))),
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
