import 'package:derzelas/logic/menu_controler.dart';
import 'package:flutter/material.dart';
import 'package:derzelas/const/colors.dart';
import 'dart:html' as html;

import 'package:flutter_svg/flutter_svg.dart';

class Social extends StatefulWidget {
  const Social({
    Key key,
  }) : super(key: key);

  @override
  State<Social> createState() => _SocialState();
}

class _SocialState extends State<Social> {
  bool hoverFacebook = false;
  bool hoverContact = false;
  bool hoverLocatie = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: (hoverFacebook) ? EdgeInsets.all(0) : EdgeInsets.all(5),
          child: Container(
            height: (hoverFacebook) ? 50 : 40,
            width: (hoverFacebook) ? 50 : 40,
            child: InkWell(
              onHover: (value) {
                setState(() {
                  hoverFacebook = value;
                });
              },
              child: SvgPicture.asset(
                'assets/img/fb.svg',
                fit: BoxFit.fitHeight,
                semanticsLabel: 'facebook',
              ),
              onTap: () {
                html.window.open(
                    'https://www.facebook.com/asociatiaderzelas', '_blank');
              },
            ),
          ),
        ),
        Padding(
          padding: (hoverContact) ? EdgeInsets.all(0) : EdgeInsets.all(5),
          child: Container(
            height: (hoverContact) ? 50 : 40,
            width: (hoverContact) ? 50 : 40,
            child: InkWell(
              onTap: () {
                html.window.open('asociatiaderzelas.ro', '_blank');
              },
              onHover: (value) {
                setState(() {
                  hoverContact = value;
                });
              },
              child: SvgPicture.asset(
                'assets/img/contact.svg',
                fit: BoxFit.fitWidth,
                semanticsLabel: 'contact',
              ),
            ),
          ),
        ),
        Padding(
          padding: (hoverLocatie) ? EdgeInsets.all(0) : EdgeInsets.all(5),
          child: Container(
            height: (hoverLocatie) ? 50 : 40,
            width: (hoverLocatie) ? 50 : 40,
            child: InkWell(
              onTap: () {
                html.window.open('asociatiaderzelas.ro', '_blank');
              },
              onHover: (value) {
                setState(() {
                  hoverLocatie = value;
                });
              },
              child: SvgPicture.asset(
                'assets/img/locatie.svg',
                fit: BoxFit.fitHeight,
                semanticsLabel: 'locație',
              ),
            ),
          ),
        ),
      ],
    );
  }
}
