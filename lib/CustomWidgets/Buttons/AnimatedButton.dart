import 'package:demo_test/Helper/CustomColors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';

class CustomAnimatedButton extends StatefulWidget {
  final String text;
  final VoidCallback button;
  var width;
  var letterSpacing;
  var bold;
  var height;
  CustomAnimatedButton({Key? key, required this.text , required this.button , this.width ,this.height, this.letterSpacing , this.bold}) : super(key: key);

  @override
  State<CustomAnimatedButton> createState() => _CustomAnimatedButtonState();
}

class _CustomAnimatedButtonState extends State<CustomAnimatedButton> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();  // Dispose the controller to avoid memory leaks
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: AnimatedButton(
        borderRadius: _height / 25,
        height: widget.height != null ? _width / widget.height :  _height / 18,
        width: widget.width != null ? _width / widget.width : _width,
        text: widget.text,
        animatedOn: AnimatedOn.onTap,
        backgroundColor: kDarkBlue,
        selectedBackgroundColor: Colors.white,
        selectedTextColor: kDarkBlue,
        transitionType: TransitionType.LEFT_TO_RIGHT,
        borderColor: kDarkBlue,
        animationDuration: Duration(seconds: 1),
        isReverse: true,
        borderWidth: 1.0,
        textStyle: TextStyle(
          fontSize: _height / 60,
          letterSpacing: widget.letterSpacing != null ? widget.letterSpacing : 1,
          color: Colors.white,
          fontWeight: widget.bold != null ? FontWeight.w400 : FontWeight.w300,
        ), onPress: () { widget.button(); },
      ),
    );
  }
}
