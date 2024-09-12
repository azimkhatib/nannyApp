import 'package:flutter/material.dart';

class Fadeanimation extends StatefulWidget {
  Widget widget;

  Fadeanimation({super.key, required this.widget});

  @override
  State<Fadeanimation> createState() => _FadeanimationState();
}

class _FadeanimationState extends State<Fadeanimation>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: Duration(seconds: 2),
    vsync: this,
  )..repeat(reverse: true);
  late final CurvedAnimation _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.easeIn,
  );

  @override
  void initState() {
    super.initState();
  }

  void dispose() {
    _animation.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(opacity: _animation, child: widget.widget);
  }
}
