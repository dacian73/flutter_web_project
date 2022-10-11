import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'homepage.dart';
import 'messenger.dart';

class VerifyEmailPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => VerifyEmailPageState();
}

class VerifyEmailPageState extends State<VerifyEmailPage> {
  bool isEmailVerified = false;
  bool canResendEmail = false;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;

    if (!isEmailVerified) {
      sendVerificationEmail();

      timer =
          Timer.periodic(Duration(seconds: 3), (_) => checkEmailVerification());
    }
  }

  @override
  void dispose() {
    timer?.cancel();

    super.dispose();
  }

  Future sendVerificationEmail() async {
    try {
      final user = FirebaseAuth.instance.currentUser!;
      await user.sendEmailVerification();
      setState(() {
        canResendEmail = false;
      });
      await Future.delayed(Duration(seconds: 30));
      setState(() {
        canResendEmail = true;
      });
    } catch (e) {
      Messenger.showSnackBar(e.toString());
    }
  }

  Future checkEmailVerification() async {
    await FirebaseAuth.instance.currentUser!.reload();

    setState(() {
      isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    });

    if (isEmailVerified) {
      timer?.cancel();
    }
  }

  @override
  Widget build(BuildContext context) => isEmailVerified
      ? HomePage()
      : Scaffold(
          appBar: AppBar(
            title: Text('Email not verified'),
          ),
          body: Padding(
            padding: EdgeInsets.all(48),
            child: Center(
                child: Column(
              children: [
                Text(
                  'An email with a verification link was sent. You will have access to your account after you verify your email.',
                  style: TextStyle(fontSize: 24, color: Colors.blue),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 40,
                ),
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                      minimumSize: Size.fromHeight(40)),
                  onPressed: canResendEmail ? sendVerificationEmail : null,
                  icon: Icon(Icons.repeat_on),
                  label: Text(
                    'Resend email',
                    style: TextStyle(fontSize: 24),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                TextButton(
                  style: ElevatedButton.styleFrom(
                      minimumSize: Size.fromHeight(40)),
                  onPressed: () => FirebaseAuth.instance.signOut(),
                  child: Text(
                    'Cancel',
                    style: TextStyle(fontSize: 24),
                  ),
                ),
              ],
            )),
          ));
}
