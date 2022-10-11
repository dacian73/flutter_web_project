import 'package:derzelas/admin/admin_page.dart';
import 'package:flutter/material.dart';

import '../const/colors.dart';

class LoginPage extends StatefulWidget {
  State createState() => new LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  String username = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: galben,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text('Login to the admin page'),
            Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              const SizedBox(
                height: 40,
              ),
              TextField(
                onChanged: (value) {
                  username = value;
                },
                cursorColor: Colors.white,
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(labelText: 'Email'),
              ),
              const SizedBox(
                height: 4,
              ),
              TextField(
                onChanged: (value) {
                  password = value;
                },
                cursorColor: Colors.white,
                textInputAction: TextInputAction.done,
                decoration: const InputDecoration(labelText: 'Password'),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton.icon(
                  onPressed: () {
                    if ((username == 'admin') && (password == 'parola1')) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AdminPage()),
                      );
                    }
                  },
                  icon: Icon(Icons.login_rounded, size: 32),
                  label: Text(
                    'Sign in',
                    style: TextStyle(fontSize: 24),
                  ))
            ]),
          ],
        ),
      ),
    );
  }
}
