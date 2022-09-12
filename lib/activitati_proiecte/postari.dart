import 'package:derzelas/homePage/const/colors.dart';
import 'package:derzelas/general_widgets/post_card.dart';
import 'package:derzelas/logic/responsive.dart';
import 'package:flutter/material.dart';
import 'package:derzelas/general_widgets/search.dart';

import 'package:derzelas/activitati_proiecte/postari/postari_data.dart';
import '../general_widgets/categories.dart';
import '../general_widgets/recent_posts.dart';

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
                return PostCard(postari[index][0], postari[index][1],
                    postari[index][2], postari[index][3]);
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
