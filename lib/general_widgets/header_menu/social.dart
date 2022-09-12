import 'package:derzelas/logic/menu_controler.dart';
import 'package:flutter/material.dart';
import 'package:derzelas/const/colors.dart';
import 'dart:html' as html;

class Social extends StatelessWidget {
  const Social({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: smallPadding),
          child: Container(
            height: 40,
            child: InkWell(
              child: Image.asset(
                'assets/img/fb.png',
                fit: BoxFit.fitHeight,
                color: turcoaz,
              ),
              onTap: () {
                html.window.open(
                    'https://www.facebook.com/asociatiaderzelas', '_blank');
              },
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: smallPadding),
          child: Container(
            height: 40,
            child: Image.asset(
              'assets/img/contact.png',
              fit: BoxFit.fitHeight,
              color: turcoaz,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: smallPadding),
          child: Container(
            height: 40,
            child: Image.asset(
              'assets/img/locatie.png',
              fit: BoxFit.fitHeight,
              color: turcoaz,
            ),
          ),
        ),
      ],
    );
  }
}
