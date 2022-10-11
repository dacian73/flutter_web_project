import 'package:derzelas/const/colors.dart';
import 'package:flutter/material.dart';

import 'sidebarContainer.dart';

class Categories extends StatelessWidget {
  const Categories({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SidebarContainer(
      title: "Categorii",
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Category(
            title: 'Terapie prin Artă',
            numOfItems: 10,
            press: () {},
          ),
          Category(
            title: 'Terapie prin Dans',
            numOfItems: 4,
            press: () {},
          ),
          Category(
            title: 'Evenimente',
            numOfItems: 1,
            press: () {},
          ),
        ],
      ),
    );
  }
}

class Category extends StatelessWidget {
  final String title;
  final int numOfItems;
  final VoidCallback press;
  const Category({
    Key? key,
    required this.title,
    required this.numOfItems,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: smallPadding / 2),
      child: TextButton(
        onPressed: () {},
        child: Text.rich(
          TextSpan(
            text: title,
            style: TextStyle(color: Colors.black54),
            children: [
              TextSpan(
                text: " ($numOfItems)",
                style: TextStyle(color: Colors.black),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
