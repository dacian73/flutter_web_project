import 'package:derzelas/logic/menu_controler.dart';
import 'package:flutter/material.dart';
import 'package:derzelas/const/colors.dart';
import 'dart:html' as html;

import 'package:flutter_svg/flutter_svg.dart';

class Indrazneste extends StatefulWidget {
  const Indrazneste({
    Key key,
  }) : super(key: key);

  @override
  State<Indrazneste> createState() => _IndraznesteState();
}

class _IndraznesteState extends State<Indrazneste> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 200,
          child: FloatingActionButton(
            hoverColor: piersica,
            splashColor: albastru_cer,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15.0))),
            onPressed: () {},
            hoverElevation: 8,
            child: Text(
              'Îndrăznește și tu!',
              style: TextStyle(
                  color: mov, fontWeight: FontWeight.w900, fontSize: 18),
            ),
            backgroundColor: turcoaz,
          ),
        ),
      ],
    );
  }
}
