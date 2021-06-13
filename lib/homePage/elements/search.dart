import 'package:derzelas/homePage/colors.dart';
import 'package:flutter/material.dart';
import 'sidebarContainer.dart';

class Search extends StatelessWidget {
  const Search({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SidebarContainer(
      title: "Caută",
      child: TextField(
        onChanged: (value) {},
        decoration: InputDecoration(
          hintText: "Scrie aici ...",
          suffixIcon: Padding(
            padding: const EdgeInsets.all(smallPadding),
            child: Icon(Icons.search),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(smallPadding),
            ),
            borderSide: BorderSide(color: Color(0xFFCCCCCC)),
          ),
        ),
      ),
    );
  }
}