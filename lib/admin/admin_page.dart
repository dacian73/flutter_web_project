import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../const/colors.dart';

class AdminPage extends StatefulWidget {
  State createState() => new AdminPageState();
}

class AdminPageState extends State<AdminPage> {
  SharedPreferences preferences;

  @override
  void initState() {
    super.initState();
    initializePreference().whenComplete(() {
      setState(() {});
    });
  }

  Future<void> initializePreference() async {
    this.preferences = await SharedPreferences.getInstance();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: albastru,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Text('Pagina de Administrator'),
              Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text('Bun venit'),
                const SizedBox(
                  height: 40,
                ),
                InkWell(
                  child: Icon(Icons.skip_next),
                  onTap: () {
                    this.preferences.setString('titlu', 'you');
                  },
                )
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
