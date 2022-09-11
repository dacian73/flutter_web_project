import 'package:derzelas/homePage/colors.dart';
import 'package:derzelas/logic/responsive.dart';
import 'package:flutter/material.dart';
import 'package:derzelas/homePage/elements/search.dart';

import 'elements/categories.dart';
import 'elements/recent_posts.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({
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
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: largePadding),
                child: Column(
                  children: [
                    Image.network(
                        'http://asociatiaderzelas.ro/wp-content/uploads/Presentation7-960x286.jpg'),
                    Container(
                      padding: EdgeInsets.all(largePadding),
                      decoration: BoxDecoration(
                          color: albastru_cer,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10),
                          )),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                'HOMEPAGE'.toUpperCase(),
                                style: TextStyle(
                                    color: negru,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                width: largePadding,
                              ),
                              Text(
                                text1,
                                style: Theme.of(context).textTheme.caption,
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: smallPadding),
                            child: Text(
                              text2,
                              style: TextStyle(
                                  color: negru,
                                  fontSize: 32,
                                  height: 1.2,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          Text(
                            text3,
                            style: TextStyle(color: negru, height: 1.5),
                            maxLines: 4,
                          ),
                          SizedBox(
                            height: largePadding,
                          ),
                          Row(
                            children: [
                              TextButton(
                                  onPressed: () {},
                                  child: Container(
                                      padding: EdgeInsets.only(
                                          bottom: smallPadding / 2),
                                      decoration: BoxDecoration(
                                          border: Border(
                                              bottom: BorderSide(
                                                  color: mov, width: 2))),
                                      child: Text('Citește mai mult'))),
                              Spacer(),
                              IconButton(
                                icon: Icon(Icons.comment_rounded),
                                onPressed: () {},
                              ),
                              IconButton(
                                icon: Icon(Icons.share_rounded),
                                onPressed: () {},
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
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
