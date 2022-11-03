import 'package:derzelas/const/colors.dart';
import 'package:derzelas/general_widgets/databox.dart';
import 'package:flutter/material.dart';
import 'dart:html' as html;

import 'package:google_fonts/google_fonts.dart';

import '../logic/responsive.dart';

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
          if (Responsive.isDesktop(context))
            Row(
              children: [
                Container(
                  height: 200,
                  width: 400,
                  decoration: new BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                      ),
                      image: new DecorationImage(
                        fit: BoxFit.cover,
                        alignment: FractionalOffset.center,
                        image: new NetworkImage(
                          imageUrl,
                        ),
                      )),
                ),
                Expanded(
                  child: Container(
                    height: 200,
                    padding: EdgeInsets.all(largePadding),
                    decoration: BoxDecoration(
                        color: albastru_cer,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(10),
                        )),
                    child: Row(children: [
                      if (data != null)
                        DataBox(data.substring(0, 2), data.substring(3, 12)),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: smallPadding, horizontal: largePadding),
                        child: Text(
                          titlu,
                          style: GoogleFonts.cinzel(
                            textStyle: TextStyle(
                              fontSize: 34,
                              height: 1.2,
                              letterSpacing: 2,
                              color: Colors.grey[900],
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ]),
                  ),
                ),
              ],
            ),
          if (!Responsive.isDesktop(context))
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
                if (!Responsive.isDesktop(context))
                  Row(
                    children: [
                      if (data != null)
                        DataBox(data.substring(0, 2), data.substring(3, 12)),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: smallPadding, horizontal: largePadding),
                        child: Text(
                          titlu,
                          style: GoogleFonts.cinzel(
                            textStyle: TextStyle(
                              fontSize: 34,
                              height: 1.2,
                              letterSpacing: 2,
                              color: Colors.grey[900],
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    text,
                    style: GoogleFonts.playfairDisplay(
                      textStyle: TextStyle(
                        fontSize: 18,
                        color: Colors.grey[700],
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                  ),
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
