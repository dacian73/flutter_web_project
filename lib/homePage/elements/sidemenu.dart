import 'package:derzelas/homePage/colors.dart';
import 'package:derzelas/homePage/elements/categories.dart';
import 'package:derzelas/homePage/elements/recent_posts.dart';
import 'package:derzelas/homePage/elements/search.dart';
import 'package:derzelas/logic/menu_controler.dart';
import 'package:derzelas/logic/responsive.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SideMenu extends StatelessWidget {
  final MenuController _controller = Get.put(MenuController());

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        child: Obx(
          () => ListView(
            children: [
              DrawerHeader(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: largePadding),
                  child: Image.asset('assets/img/logo.png'),
                ),
              ),
              ...List.generate(
                _controller.menuItems.length,
                (index) => DrawerItem(
                  isActive: index == _controller.selectedIndex,
                  title: _controller.menuItems[index],
                  press: () {
                    _controller.setMenuIndex(index);
                  },
                ),
              ),
              if (Responsive.isMobile(context))
                Column(
                  children: [
                    Search(),
                    SizedBox(height: largePadding),
                    Categories(),
                    SizedBox(height: largePadding),
                    RecentPosts(),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class DrawerItem extends StatelessWidget {
  final String title;
  final bool isActive;
  final VoidCallback press;

  const DrawerItem({
    Key key,
    @required this.title,
    @required this.isActive,
    @required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: largePadding),
        selected: isActive,
        selectedTileColor: albastru,
        tileColor: turcoaz,
        onTap: press,
        title: Text(
          title,
          style: TextStyle(color: negru),
        ),
      ),
    );
  }
}
