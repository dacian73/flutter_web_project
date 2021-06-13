import 'package:derzelas/homePage/colors.dart';
import 'package:flutter/material.dart';

class PostCard extends StatelessWidget {
  const PostCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: largePadding),
      child: Column(
        children: [
          Image.network(
              'http://asociatiaderzelas.ro/wp-content/uploads/Presentation7-960x286.jpg'),
          Container(
            padding: EdgeInsets.all(largePadding),
            decoration: BoxDecoration(
                color: Color(0xFFAFD2E8),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                )),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'Activități'.toUpperCase(),
                      style: TextStyle(
                          color: darkTextColor,
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
                  padding:
                  const EdgeInsets.symmetric(vertical: smallPadding),
                  child: Text(
                    text2,
                    style: TextStyle(
                        color: darkTextColor,
                        fontSize: 32,
                        height: 1.2,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                Text(
                  text3,
                  style: TextStyle(color: darkTextColor, height: 1.5),
                  maxLines: 4,
                ),
                SizedBox(
                  height: largePadding,
                ),
                Row(
                  children: [
                    TextButton(
                        onPressed: () {}, child: Container(padding: EdgeInsets.only(bottom: smallPadding/2), decoration: BoxDecoration(border: Border(bottom: BorderSide(color: accentColor, width: 2))),child: Text('Citește mai mult'))),
                    Spacer(),
                    IconButton(icon: Icon(Icons.comment_rounded), onPressed: (){},),
                    IconButton(icon: Icon(Icons.share_rounded), onPressed: (){},),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}