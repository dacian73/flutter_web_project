import 'package:derzelas/const/colors.dart';
import 'package:flutter/material.dart';
import 'dart:html' as html;

class PostCard extends StatelessWidget {
  const PostCard(this.titlu, this.imageUrl, this.text, this.link,
      this.categorie, this.data);

  final String titlu;
  final String imageUrl;
  final String text;
  final String link;
  final String categorie;
  final String data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: largePadding),
      child: Column(
        children: [
          if (imageUrl != null)
            new AspectRatio(
              aspectRatio: 3 / 1,
              child: new Container(
                decoration: new BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                    ),
                    image: new DecorationImage(
                      fit: BoxFit.fitWidth,
                      alignment: FractionalOffset.center,
                      image: new NetworkImage(
                        imageUrl,
                      ),
                    )),
              ),
            ),
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
                    if (data != null)
                      Container(
                        margin: EdgeInsets.all(8),
                        width: 80,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            )),
                        child: Column(
                          children: [
                            Text(
                              data.substring(0, 2),
                              style: TextStyle(fontSize: 28, letterSpacing: 6),
                            ),
                            Divider(
                              thickness: 2,
                              height: 8,
                            ),
                            Text(
                              data.substring(3, 12),
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                    if (categorie != null)
                      Text(
                        categorie.toUpperCase(),
                        style: TextStyle(
                            color: negru,
                            fontSize: 12,
                            fontWeight: FontWeight.bold),
                      ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: smallPadding),
                  child: Text(
                    titlu,
                    style: TextStyle(
                        color: negru,
                        fontSize: 32,
                        height: 1.2,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                Text(
                  text,
                  style: TextStyle(color: negru, height: 1.5),
                  maxLines: 4,
                ),
                SizedBox(
                  height: largePadding,
                ),
                Row(
                  children: [
                    if (link != null)
                      TextButton(
                          onPressed: () {
                            html.window.open(link, '_blank');
                          },
                          child: Container(
                              padding:
                                  EdgeInsets.only(bottom: smallPadding / 2),
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom:
                                          BorderSide(color: mov, width: 2))),
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
    );
  }
}
