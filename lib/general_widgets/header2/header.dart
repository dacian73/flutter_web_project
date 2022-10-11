import 'package:derzelas/general_widgets/header/social.dart';
import 'package:derzelas/const/colors.dart';
import 'package:derzelas/const/texte.dart';
import 'package:derzelas/general_widgets/indrazneste.dart';
import 'package:derzelas/logic/menu_controler.dart';
import 'package:derzelas/logic/responsive.dart';
import 'package:flutter/material.dart';
import 'package:derzelas/general_widgets/header/main_menu.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Header extends StatelessWidget {
  final MenuController _controller = Get.put(MenuController());

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: (Responsive.isDesktop(context)) ? 350 : 150,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            mov,
            turcoaz,
          ],
        ),
      ),
      child: SafeArea(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(smallPadding),
              constraints: BoxConstraints(maxWidth: double.infinity),
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
                      SizedBox(
                        width: 8,
                      ),
                      Column(
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
                      ),
                    ],
                  ),
                  Spacer(),
                  if (Responsive.isDesktop(context)) MainMenu(),
                  Spacer(),
                  Indrazneste(),
                  Spacer(),
                  if (Responsive.isDesktop(context)) Social(),
                ],
              ),
            ),
            if (Responsive.isDesktop(context))
              Expanded(
                flex: 4,
                child: GetX<MenuController>(
                  init: MenuController(),
                  builder: (val) => (val.selectedIndex == 0)
                      ? MainHeaderTextFirstPage('Îndrăznim pentru că ne pasă!',
                          prezentareAsociatieFormatata, true)
                      : (val.selectedIndex == 1)
                          ? MainHeaderTextFirstPage(
                              'Activități și Proiecte!', misiuneFormatata, true)
                          : (val.selectedIndex == 2)
                              ? MainHeaderTextFirstPage(
                                  'Activități și Proiecte!',
                                  misiuneFormatata,
                                  true)
                              : MainHeaderTextFirstPage('Despre Noi',
                                  despreNoiPrezentareFormatata, false),
                ),
              ),
          ],
        ),
      ),
    );
  }

  MainHeaderTextFirstPage(String titlu, text, bool cuButon) {
    final List<Widget> imageSliders = imgList
        .map((item) => Container(
              child: Container(
                margin: EdgeInsets.all(5.0),
                child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    child: Stack(
                      children: <Widget>[
                        Image.network(item, fit: BoxFit.cover, width: 1000.0),
                        Positioned(
                          bottom: 0.0,
                          left: 0.0,
                          right: 0.0,
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Color.fromARGB(200, 0, 0, 0),
                                  Color.fromARGB(0, 0, 0, 0)
                                ],
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                              ),
                            ),
                            padding: EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 20.0),
                            child: Text(
                              'No. ${imgList.indexOf(item)} image',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )),
              ),
            ))
        .toList();

    return Row(
      children: [
        Container(
          child: CarouselSlider(
            options: CarouselOptions(
              autoPlay: true,
              aspectRatio: 2.0,
              enlargeCenterPage: true,
            ),
            items: imageSliders,
          ),
        ),
        Column(
          children: [
            Text(
              titlu,
              style: TextStyle(
                  fontSize: 32, fontWeight: FontWeight.bold, color: turcoaz),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(
                  largePadding, largePadding, 0, smallPadding),
              child: Text(
                text,
                style: TextStyle(color: piersica, fontSize: 16, height: 1.5),
                textAlign: TextAlign.center,
              ),
            ),
            if (cuButon)
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
        ),
      ],
    );
  }
}
