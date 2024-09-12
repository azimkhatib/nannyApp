import 'package:flutter/material.dart';

class AnimatedPhysicalModelExample extends StatefulWidget {
  Widget widget;
  AnimatedPhysicalModelExample({super.key , required this.widget});
  @override
  _AnimatedPhysicalModelExampleState createState() =>
      _AnimatedPhysicalModelExampleState();
}

class _AnimatedPhysicalModelExampleState
    extends State<AnimatedPhysicalModelExample> {
  bool _isElevated = true;

  @override
  Widget build(BuildContext context) {
    return AnimatedPhysicalModel(
        duration: Duration(seconds: 1),
        curve: Curves.easeInOut,
        elevation: _isElevated ? 10.0 : 0.0,
        shape: BoxShape.rectangle,
        shadowColor: Colors.black,
        color: Colors.white,
        borderRadius: _isElevated
            ? BorderRadius.circular(20.0)
            : BorderRadius.circular(0.0),
        child: widget.widget
    );
  }
}