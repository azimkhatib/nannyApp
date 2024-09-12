import 'package:flutter/material.dart';

class NointernetConnection extends StatefulWidget {
  const NointernetConnection({Key? key}) : super(key: key);

  @override
  State<NointernetConnection> createState() => _NointernetConnectionState();
}

class _NointernetConnectionState extends State<NointernetConnection> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Text('Noo Internet'),
        ),
      ),
    );
  }
}
