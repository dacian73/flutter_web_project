import 'package:flutter/material.dart';

class WaitingPage extends StatefulWidget {
  const WaitingPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => WaitingPageState();
}

class WaitingPageState extends State<WaitingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Connecting...'),
        ),
        body: const Center(
          child: CircularProgressIndicator(),
        ));
  }
}
