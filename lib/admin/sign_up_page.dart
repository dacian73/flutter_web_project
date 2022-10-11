import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';

import 'main_admin.dart';
import 'messenger.dart';

class SignUpPage extends StatefulWidget {
  final Function() onClickedSignIn;

  const SignUpPage({
    Key? key,
    required this.onClickedSignIn,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final formKey = GlobalKey<FormState>();
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
      body: Form(
        key: formKey,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const SizedBox(
            height: 40,
          ),
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (email) =>
                email != null && !EmailValidator.validate(email)
                    ? 'Enter a valid email'
                    : null,
            controller: emailControler,
            cursorColor: Colors.white,
            textInputAction: TextInputAction.next,
            decoration: const InputDecoration(labelText: 'Email'),
          ),
          const SizedBox(
            height: 4,
          ),
          TextFormField(
            obscureText: true,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (password) => password != null && password.length < 6
                ? 'The password must have at least 6 characters'
                : null,
            controller: passwordControler,
            cursorColor: Colors.white,
            textInputAction: TextInputAction.done,
            decoration: const InputDecoration(labelText: 'Password'),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton.icon(
              onPressed: signUp,
              icon: Icon(Icons.app_registration, size: 32),
              label: Text(
                'Sign Up',
                style: TextStyle(fontSize: 24),
              )),
          const SizedBox(
            height: 40,
          ),
          RichText(
              text: TextSpan(
            style: TextStyle(color: Colors.deepOrange, fontSize: 16),
            text: 'Already have an account? ',
            children: [
              TextSpan(
                recognizer: TapGestureRecognizer()
                  ..onTap = widget.onClickedSignIn,
                text: 'Sign in!',
                style: TextStyle(
                  color: Colors.blueAccent,
                  decoration: TextDecoration.underline,
                ),
              ),
            ],
          )),
        ]),
      ),
    );
  }

  Future signUp() async {
    final isValid = formKey.currentState!.validate();
    if (!isValid) return;

    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
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
