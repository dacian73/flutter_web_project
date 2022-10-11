import 'package:derzelas/general_widgets/header/social.dart';
import 'package:derzelas/const/colors.dart';
import 'package:derzelas/const/texte.dart';
import 'package:derzelas/logic/menu_controler.dart';
import 'package:derzelas/logic/responsive.dart';
import 'package:flutter/material.dart';
import 'package:derzelas/general_widgets/header/main_menu.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:html' as html;
import 'package:derzelas/admin/login.dart';

class Footer extends StatelessWidget {
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
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: GetX<MenuController>(
                    init: MenuController(),
                    builder: (val) => (val.selectedIndex == 0)
                        ? LogoParteneri('Partenerii noștrii')
                        : (val.selectedIndex == 1)
                            ? Text('Blabla 1')
                            : (val.selectedIndex == 2)
                                ? Text('Blabla 2')
                                : Text('Blabla 3'),
                  ),
                ),
              ],
            ),
            InkWell(
              child: Icon(Icons.login),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
            )
          ],
        ),
      ),
    );
  }

  LogoParteneri(String titlu) {
    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: 10,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () {
              html.window.open('https://frh.ro/', '_blank');
            },
            child: Image(
              image: AssetImage('assets/img/logo_frh.png'),
              height: 80,
              semanticLabel: 'Federația Română de Handbal',
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () {
              html.window.open('https://ribeit.ro/', '_blank');
            },
            child: Image(
              image: AssetImage('assets/img/logo_ribeit.jpg'),
              height: 80,
              semanticLabel: 'Ribeit',
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () {
              html.window.open('_blank', '_blank');
            },
            child: Image(
              image: AssetImage('assets/img/logo_emerson.png'),
              height: 80,
              semanticLabel: 'Emerson',
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () {
              html.window.open('https://rpw.ro/', '_blank');
            },
            child: Image(
              image: AssetImage('assets/img/logo_rpw.jpg'),
              height: 80,
              semanticLabel: 'Romanian Pro Wrestling',
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () {
              html.window.open('http://www.clujulpedaleaza.ro/', '_blank');
            },
            child: Image(
              image: AssetImage('assets/img/logo_cp.jpg'),
              height: 80,
              semanticLabel: 'Clujul Pedalează',
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () {
              html.window.open('_blank', '_blank');
            },
            child: Image(
              image: AssetImage('assets/img/logo_artpoint.png'),
              height: 80,
              semanticLabel: 'ArtPoint',
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () {
              html.window.open('http://salesconsulting.ro/', '_blank');
            },
            child: Image(
              image: AssetImage('assets/img/logo_salesconsulting.png'),
              height: 80,
              semanticLabel: 'Sales Consulting',
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () {
              html.window.open('https://www.starlubricants.ro/', '_blank');
            },
            child: Image(
              image: AssetImage('assets/img/logo_starlubricants.jpg'),
              height: 80,
              semanticLabel: 'Star Lubricants',
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () {
              html.window.open('https://www.brinel.ro/', '_blank');
            },
            child: Image(
              image: AssetImage('assets/img/logo_brinel.png'),
              height: 80,
              semanticLabel: 'Star Lubricants',
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () {
              html.window.open('_blank', '_blank');
            },
            child: Image(
              image: AssetImage('assets/img/logo_downcer.png'),
              height: 80,
              semanticLabel: 'Downcer',
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () {
              html.window.open('_blank', '_blank');
            },
            child: Image(
              image: AssetImage('assets/img/logo_nspyre.png'),
              height: 80,
              semanticLabel: 'NSPYRE',
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () {
              html.window.open('_blank', '_blank');
            },
            child: Image(
              image: AssetImage('assets/img/logo_agressione.jpg'),
              height: 80,
              semanticLabel: 'Agressione Group',
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () {
              html.window.open('https://www.ambient.ro/', '_blank');
            },
            child: Image(
              image: AssetImage('assets/img/logo_ambient.png'),
              height: 80,
              semanticLabel: 'Ambient',
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () {
              html.window.open('https://www.skep.gr/en', '_blank');
            },
            child: Image(
              image: AssetImage('assets/img/logo_skep.png'),
              height: 80,
              semanticLabel: 'Skep',
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () {
              html.window.open('_blank', '_blank');
            },
            child: Image(
              image: AssetImage('assets/img/logo_sunimprof.png'),
              height: 80,
              semanticLabel: 'Sunimprof',
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () {
              html.window.open('_blank', '_blank');
            },
            child: Image(
              image: AssetImage('assets/img/logo_techsoup.jpg'),
              height: 80,
              semanticLabel: 'Techsoup',
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () {
              html.window.open('https://www.austral.ro/', '_blank');
            },
            child: Image(
              image: AssetImage('assets/img/logo_austral.png'),
              height: 80,
              semanticLabel: 'Austral',
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () {
              html.window.open('_blank', '_blank');
            },
            child: Image(
              image: AssetImage('assets/img/logo_delonghi.webp'),
              height: 80,
              semanticLabel: 'De Longhi',
            ),
          ),
        ),
      ],
    );
  }
}
