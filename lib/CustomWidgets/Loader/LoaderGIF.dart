import 'package:flutter/material.dart';

class LoaderGIF extends StatefulWidget {
  const LoaderGIF({Key? key}) : super(key: key);

  @override
  State<LoaderGIF> createState() => _LoaderGIFState();
}

class _LoaderGIFState extends State<LoaderGIF> with TickerProviderStateMixin{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Image.asset('assets/GIF/LoaderGIF.gif'),
    );
  }
}
