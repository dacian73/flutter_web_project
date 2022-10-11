import 'package:derzelas/admin/editeaza_header.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'forgot_password_page.dart';
import 'main_admin.dart';
import 'messenger.dart';

class LoginPage extends StatefulWidget {
  final VoidCallback onClickSignUp;

  const LoginPage({
    Key? key,
    required this.onClickSignUp,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final emailControler = TextEditingController();
  final passwordControler = TextEditingController();

  @override
  void dispose() {
    emailControler.dispose();
    passwordControler.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        const SizedBox(
          height: 40,
        ),
        TextField(
          controller: emailControler,
          cursorColor: Colors.white,
          textInputAction: TextInputAction.next,
          decoration: const InputDecoration(labelText: 'Email'),
        ),
        const SizedBox(
          height: 4,
        ),
        TextField(
          obscureText: true,
          controller: passwordControler,
          cursorColor: Colors.white,
          textInputAction: TextInputAction.done,
          decoration: const InputDecoration(labelText: 'Password'),
        ),
        const SizedBox(
          height: 20,
        ),
        ElevatedButton.icon(
            onPressed: signIn,
            icon: Icon(Icons.login_rounded, size: 32),
            label: Text(
              'Sign in',
              style: TextStyle(fontSize: 24),
            )),
        const SizedBox(
          height: 40,
        ),
        GestureDetector(
          child: ForgotPasswordText(),
          onTap: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => ForgotPasswordPage())),
        ),
        RichText(
            text: TextSpan(
          style: TextStyle(color: Colors.deepOrange, fontSize: 16),
          text: 'New user? ',
          children: [
            TextSpan(
              recognizer: TapGestureRecognizer()..onTap = widget.onClickSignUp,
              text: 'Sign up!',
              style: TextStyle(
                color: Colors.blueAccent,
                decoration: TextDecoration.underline,
              ),
            ),
          ],
        )),
      ]),
    );
  }

  Text ForgotPasswordText() {
    return Text(
      'Forgot Password',
      style: TextStyle(
          color: Colors.blue,
          decoration: TextDecoration.underline,
          fontSize: 24),
    );
  }

  Future signIn() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailControler.text.trim(),
          password: passwordControler.text.trim());
    } on FirebaseAuthException catch (e) {
      print(e);

      Messenger.showSnackBar(e.message);
    }
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MainAdmin()),
    );
  }
}
