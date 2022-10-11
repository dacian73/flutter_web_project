import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'authentification.dart';
import 'connecting.dart';
import 'errorconnecting.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'messenger.dart';
import 'verify_email.dart';

final navigatorKey = GlobalKey<NavigatorState>();

class MainAdmin extends StatelessWidget {
  const MainAdmin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scaffoldMessengerKey: messengerKey,
      navigatorKey: navigatorKey,
      title: 'Admin Page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyAdminHomePage(title: 'Admin Page'),
    );
  }
}

class MyAdminHomePage extends StatefulWidget {
  const MyAdminHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyAdminHomePage> createState() => _MyAdminHomePageState();
}

class _MyAdminHomePageState extends State<MyAdminHomePage> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const WaitingPage();
          } else if (snapshot.hasError) {
            return const ErrorPage();
          } else if (snapshot.hasData) {
            return VerifyEmailPage();
          } else {
            return AuthentificationPage();
          }
        });
  }
}
