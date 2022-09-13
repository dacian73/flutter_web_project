import 'package:derzelas/general_widgets/header_menu/social.dart';
import 'package:derzelas/const/colors.dart';
import 'package:derzelas/const/texte.dart';
import 'package:derzelas/logic/menu_controler.dart';
import 'package:derzelas/logic/responsive.dart';
import 'package:flutter/material.dart';
import 'package:derzelas/general_widgets/header_menu/main_menu.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class Header extends StatelessWidget {
  final MenuController _controller = Get.put(MenuController());

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: (Responsive.isDesktop(context)) ? 350 : 150,
      color: mov,
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
                  Row(
                    children: [
                      Container(
                        height: 100,
                        width: 100,
                        child: SvgPicture.asset('assets/img/logo.svg',
                            color: turcoaz, semanticsLabel: 'Derzelas Logo'),
                      ),
                      (Responsive.isDesktop(context))
                          ? SizedBox(
                              width: 8,
                            )
                          : null,
                      (Responsive.isDesktop(context))
                          ? Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      'D',
                                      style: GoogleFonts.cinzel(
                                          textStyle: TextStyle(
                                        color: turcoaz,
                                        fontSize: 38,
                                      )),
                                    ),
                                    Text(
                                      'ERZELAS',
                                      style: GoogleFonts.cinzel(
                                          textStyle: TextStyle(
                                              color: turcoaz, fontSize: 28)),
                                    ),
                                  ],
                                ),
                                Text(
                                  'DARE TO CARE',
                                  style: GoogleFonts.cinzel(
                                      textStyle: TextStyle(
                                          color: turcoaz,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500)),
                                ),
                              ],
                            )
                          : null,
                    ],
                  ),
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
