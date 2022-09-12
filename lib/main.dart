import 'package:derzelas/general_widgets/header_menu/header.dart';
import 'package:derzelas/general_widgets/header_menu/sidemenu.dart';
import 'package:derzelas/homePage/const/colors.dart';
import 'package:derzelas/logic/menu_controler.dart';
import 'package:flutter/material.dart';
import 'package:derzelas/activitati_proiecte/postari.dart';
import 'package:get/get.dart';
import 'package:derzelas/homePage/firstPage.dart';

void main() {
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
                builder: (val) =>
                    (val.selectedIndex == 0) ? FirstPage() : Postari(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
