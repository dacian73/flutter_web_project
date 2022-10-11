import 'package:derzelas/const/colors.dart';
import 'package:derzelas/general_widgets/categories.dart';
import 'package:derzelas/general_widgets/recent_posts.dart';
import 'package:derzelas/general_widgets/search.dart';
import 'package:derzelas/logic/menu_controler.dart';
import 'package:derzelas/logic/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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
                  child: SvgPicture.asset('assets/img/logo.svg',
                      color: turcoaz, semanticsLabel: 'Derzelas Logo'),
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
          style: TextStyle(color: piersica),
        ),
      ),
    );
  }
}
