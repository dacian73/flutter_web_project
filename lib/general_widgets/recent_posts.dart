import 'package:derzelas/const/colors.dart';
import 'package:flutter/material.dart';

import 'sidebarContainer.dart';

class RecentPosts extends StatelessWidget {
  const RecentPosts({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SidebarContainer(
      title: "Postări Recente",
      child: Column(
        children: [
          RecentPostCard(
            image: "assets/images/recent_1.png",
            title: "Atelier de terapie prin artă – 21.05.2019",
            press: () {},
          ),
          SizedBox(height: largePadding),
          RecentPostCard(
            image: "assets/images/recent_2.png",
            title: "Târg de primavară – EMERSON – 28.02.2019",
            press: () {},
          ),
        ],
      ),
    );
  }
}

class RecentPostCard extends StatelessWidget {
  final String image, title;
  final VoidCallback press;

  const RecentPostCard({
    Key key,
    @required this.image,
    @required this.title,
    @required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: press,
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Image.asset(image),
            ),
            SizedBox(width: largePadding),
            Expanded(
              flex: 5,
              child: Text(
                title,
                maxLines: 2,
                style: TextStyle(
                  fontFamily: "Raleway",
                  color: negru,
                  fontWeight: FontWeight.bold,
                  height: 1.5,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
