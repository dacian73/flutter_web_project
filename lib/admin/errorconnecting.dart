import 'package:flutter/material.dart';

class ErrorPage extends StatefulWidget {
  const ErrorPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => ErrorPageState();
}

class ErrorPageState extends State<ErrorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Error...'),
        ),
        body: const Center(child: Text('Hopa! Ceva nu a mers cum trebuie...')));
  }
}
