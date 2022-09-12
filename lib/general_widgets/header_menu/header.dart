import 'package:derzelas/general_widgets/header_menu/social.dart';
import 'package:derzelas/const/colors.dart';
import 'package:derzelas/const/texte.dart';
import 'package:derzelas/logic/menu_controler.dart';
import 'package:derzelas/logic/responsive.dart';
import 'package:flutter/material.dart';
import 'package:derzelas/general_widgets/header_menu/main_menu.dart';
import 'package:get/get.dart';

class Header extends StatelessWidget {
  final MenuController _controller = Get.put(MenuController());

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: (Responsive.isDesktop(context)) ? 350 : 150,
      color: piersica,
      child: SafeArea(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(largePadding),
              constraints: BoxConstraints(maxWidth: maxWidth),
              child: Row(
                children: [
                  if (!Responsive.isDesktop(context))
                    IconButton(
                        onPressed: () {
                          _controller.openOrCloseDrawer();
                        },
                        icon: Icon(Icons.menu)),
                  Image.asset('assets/img/logo_piersica.png'),
                  Spacer(),
                  if (Responsive.isDesktop(context)) MainMenu(),
                  Spacer(),
                  Social(),
                ],
              ),
            ),
            if (Responsive.isDesktop(context))
              Row(
                children: [
                  Expanded(
                    flex: 4,
                    child: GetX<MenuController>(
                      init: MenuController(),
                      builder: (val) => (val.selectedIndex == 0)
                          ? MainHeaderTextFirstPage()
                          : MainHeaderTextActivitatiProiecte(),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      padding: EdgeInsets.fromLTRB(
                          0, largePadding, largePadding, smallPadding),
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text('Îndrăznește și tu!'),
                        style: TextButton.styleFrom(
                            padding: EdgeInsets.all(largePadding),
                            backgroundColor: roz),
                      ),
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }

  MainHeaderTextFirstPage() {
    return Column(
      children: [
        Text(
          'Îndrăznim pentru că ne pasă!',
          style: TextStyle(
              fontSize: 32, fontWeight: FontWeight.bold, color: turcoaz),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(
              largePadding, largePadding, 0, smallPadding),
          child: Text(
            prezentareAsociatieFormatata,
            style: TextStyle(color: negru, fontSize: 16, height: 1.5),
            textAlign: TextAlign.center,
          ),
        ),
        FittedBox(
          child: TextButton(
            onPressed: () {},
            child: Row(
              children: [
                Text(
                  'Despre noi',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: turcoaz),
                ),
                SizedBox(
                  width: smallPadding,
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: alb,
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  MainHeaderTextActivitatiProiecte() {
    return Column(
      children: [
        Text(
          'Activități și Proiecte',
          style: TextStyle(
              fontSize: 32, fontWeight: FontWeight.bold, color: turcoaz),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(
              largePadding, largePadding, smallPadding, smallPadding),
          child: Text(
            misiuneFormatata,
            style: TextStyle(color: negru, fontSize: 16, height: 1.5),
            textAlign: TextAlign.center,
          ),
        ),
        FittedBox(
          child: TextButton(
            onPressed: () {},
            child: Row(
              children: [
                Text(
                  'Despre noi',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: turcoaz),
                ),
                SizedBox(
                  width: smallPadding,
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: alb,
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
