import 'package:flutter/material.dart';

import 'login.dart';
import 'sign_up_page.dart';

class AuthentificationPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => AuthentificationPageState();
}

class AuthentificationPageState extends State<AuthentificationPage> {
  bool isLogin = true;

  @override
  Widget build(BuildContext context) => isLogin
      ? LoginPage(onClickSignUp: switchPage)
      : SignUpPage(onClickedSignIn: switchPage);

  void switchPage() => setState(() => isLogin = !isLogin);
}
