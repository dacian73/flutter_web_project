import 'package:derzelas/despre_noi/despre_noi.dart';
import 'package:derzelas/general_widgets/header/header.dart';
import 'package:derzelas/general_widgets/header/sidemenu.dart';
import 'package:derzelas/const/colors.dart';
import 'package:derzelas/logic/menu_controler.dart';
import 'package:derzelas/produse_servicii/produse_servicii.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:derzelas/activitati_proiecte/postari.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:derzelas/homePage/firstPage.dart';

import 'general_widgets/footer.dart';

void main() {
  LicenseRegistry.addLicense(() async* {
    final license = await rootBundle.loadString('google_fonts/OFL.txt');
    yield LicenseEntryWithLineBreaks(['google_fonts'], license);
  });
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Asociația Derzelas',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  State createState() => new MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  int selected = 0;
  final MenuController _controller = Get.put(MenuController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: galben,
      key: _controller.scaffoldkey,
      drawer: SideMenu(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Header(),
            Container(
              padding: EdgeInsets.all(largePadding),
              constraints: BoxConstraints(maxWidth: maxWidth),
              child: GetX<MenuController>(
                init: MenuController(),
                builder: (val) => (val.selectedIndex == 0)
                    ? FirstPage()
                    : (val.selectedIndex == 1)
                        ? Postari()
                        : (val.selectedIndex == 2)
                            ? ProduseServicii()
                            : (val.selectedIndex == 3)
                                ? DespreNoi()
                                : FirstPage(),
              ),
            ),
            Footer(),
          ],
        ),
      ),
    );
  }
}
