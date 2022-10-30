import 'package:derzelas/const/colors.dart';
import 'package:derzelas/const/texte.dart';
import 'package:derzelas/general_widgets/info_card.dart';
import 'package:derzelas/general_widgets/post_card.dart';
import 'package:derzelas/logic/responsive.dart';
import 'package:flutter/material.dart';
import 'package:derzelas/general_widgets/search.dart';
import '../general_widgets/categories.dart';
import '../general_widgets/recent_posts.dart';

class ProduseServicii extends StatelessWidget {
  const ProduseServicii({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 2,
          child: Column(
            children: [
              Container(
                child: InfoCard('Produse și Servicii', null,
                    prezentarePuncteLucru, false, 10, null, null, false),
              ),
              ListView(
                shrinkWrap: true,
                children: [
                  InfoCard('Produse', null, produseDescriere, true, 3, null,
                      null, true),
                  InfoCard('Servicii', null, serviciiDescriere, true, 3, null,
                      null, true)
                ],
              ),
            ],
          ),
        ),
        // if (!Responsive.isMobile(context))
        //   SizedBox(
        //     width: largePadding,
        //   ),
        // if (!Responsive.isMobile(context))
        //   Expanded(
        //     child: Column(
        //       children: [
        //         Search(),
        //         SizedBox(height: largePadding),
        //         Categories(),
        //         SizedBox(height: largePadding),
        //         RecentPosts(),
        //       ],
        //     ),
        //   ),
      ],
    );
  }
}
