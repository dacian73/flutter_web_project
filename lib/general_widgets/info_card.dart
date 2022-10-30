import 'package:derzelas/const/colors.dart';
import 'package:flutter/material.dart';

class InfoCard extends StatefulWidget {
  const InfoCard(
      this.titlu,
      this.imageUrl,
      this.text,
      this.isExpandable,
      this.nonExpandedMaxLines,
      this.categorie,
      this.subtitlu,
      this.isShareable);

  final String titlu;
  final String? imageUrl;
  final String? text;
  final bool isExpandable;
  final int nonExpandedMaxLines;
  final String? categorie;
  final String? subtitlu;
  final bool isShareable;

  @override
  State<InfoCard> createState() => _InfoCardState();
}

class _InfoCardState extends State<InfoCard> {
  bool isReadMore = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: largePadding),
      child: Column(
        children: [
          if (widget.imageUrl != null)
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
                        widget.imageUrl!,
                      ),
                    )),
              ),
            ),
          Container(
            padding: EdgeInsets.all(largePadding),
            decoration: BoxDecoration(
                color: albastru_cer,
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                )),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    if (widget.categorie != null)
                      Text(
                        widget.categorie!.toUpperCase(),
                        style: TextStyle(
                            color: piersica,
                            fontSize: 12,
                            fontWeight: FontWeight.bold),
                      ),
                    SizedBox(
                      width: largePadding,
                    ),
                    if (widget.subtitlu != null)
                      Text(
                        widget.subtitlu!,
                        style: Theme.of(context).textTheme.caption,
                      ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: smallPadding),
                  child: Text(
                    widget.titlu,
                    style: TextStyle(
                        color: negru,
                        fontSize: 32,
                        height: 1.2,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                Text(
                  widget.text!,
                  style: TextStyle(color: negru, height: 1.5),
                  maxLines:
                      (isReadMore == false) ? widget.nonExpandedMaxLines : 200,
                ),
                SizedBox(
                  height: largePadding,
                ),
                Row(
                  children: [
                    if (widget.isExpandable)
                      TextButton(
                        onPressed: () {
                          setState(() {
                            isReadMore = !isReadMore;
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.only(bottom: smallPadding / 2),
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(color: mov, width: 2))),
                          child: (isReadMore == false)
                              ? Text('Citește mai mult')
                              : Text('Mai puțin'),
                        ),
                      ),
                    Spacer(),
                    if (widget.isShareable)
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
