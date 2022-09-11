import 'package:derzelas/homePage/colors.dart';
import 'package:derzelas/logic/menu_controler.dart';
import 'package:derzelas/logic/responsive.dart';
import 'package:flutter/material.dart';
import 'package:derzelas/homePage/elements/main_menu.dart';
import 'package:derzelas/homePage/elements/social.dart';
import 'package:get/get.dart';
import 'package:derzelas/homePage/colors.dart';

class Header extends StatelessWidget {
  final MenuController _controller = Get.put(MenuController());

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 400,
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
                  Spacer(),
                  SizedBox(
                    height: largePadding * 2,
                  ),
                ],
              ),
            ),
            Text(
              'Îndrăznim pentru că ne pasă!',
              style: TextStyle(
                  fontSize: 32, fontWeight: FontWeight.bold, color: turcoaz),
            ),
            Padding(
              padding: const EdgeInsets.all(largePadding),
              child: Text(
                'Asociația Derzelas implementează, cu personal specializat, \nprograme specifice de incluziune socio-profesională a persoanelor cu dizabilități \nși face cunoscute în rândul comunității problemele cu care acestea se confruntă.',
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
            SizedBox(
              height: largePadding,
            )
          ],
        ),
      ),
    );
  }
}
