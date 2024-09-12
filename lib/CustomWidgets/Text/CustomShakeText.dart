import 'package:flutter/material.dart';
import 'dart:math';

import 'package:flutter_shakemywidget/flutter_shakemywidget.dart';

class CustomShakeTextWidget extends StatefulWidget {
  final Text;
  final Duration duration;
  final double shakeOffset;
  final int shakeCount;
  var TextSize;
  var Bold;
  final Color bgColor;
  CustomShakeTextWidget({
    required this.Text,
    this.duration = const Duration(milliseconds: 500),
    this.shakeOffset = 10.0,
    this.shakeCount = 3,
    this.Bold,
    this.TextSize,
    this.bgColor = const Color(0xFF000000)
  });

  @override
  CustomShakeTextWidgetState createState() => CustomShakeTextWidgetState();
}

class CustomShakeTextWidgetState extends State<CustomShakeTextWidget> with SingleTickerProviderStateMixin {

  final shakeKey = GlobalKey<ShakeWidgetState>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      shakeKey.currentState?.shake();
    });
  }

  @override
  Widget build(BuildContext context) {
    return ShakeMe(
      key: shakeKey,
      shakeCount: widget.shakeCount,
      shakeOffset: widget.shakeOffset,
      shakeDuration: widget.duration,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          widget.Text,
          textAlign: TextAlign.center,
          style: TextStyle(
              color: widget.bgColor ,
              fontSize: widget.TextSize != null ? widget.TextSize : 17.0,
              fontWeight: widget.Bold != null ? FontWeight.bold : null
          ),
        ),
      ),
    );
  }
}

