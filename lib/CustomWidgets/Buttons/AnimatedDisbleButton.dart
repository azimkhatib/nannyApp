import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';

class CustomAnimatedDisableButton extends StatefulWidget {
  final String text;
  var width;
  var height;
  var letterSpacing;
  var bold;
  final VoidCallback button;
  CustomAnimatedDisableButton({Key? key, required this.text , this.width , this.letterSpacing , this.bold , required this.button,this.height}) : super(key: key);

  @override
  State<CustomAnimatedDisableButton> createState() => _CustomAnimatedDisableButtonState();
}

class _CustomAnimatedDisableButtonState extends State<CustomAnimatedDisableButton> with SingleTickerProviderStateMixin {

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
        animatedOn: AnimatedOn.onHover,
        borderRadius: _height / 25,
        height: _height / 18,
        width: widget.width != null ? _width / widget.width : _width,
        text: widget.text,
        backgroundColor: Colors.black26,
        selectedBackgroundColor: Colors.white,
        selectedTextColor: Colors.black,
        borderColor: Colors.black,
        borderWidth: 1.0,
        textStyle: TextStyle(
          fontSize: _height / 50,
          letterSpacing: widget.letterSpacing != null ? widget.letterSpacing : 1,
          color: Colors.white,
          fontWeight: widget.bold != null ? FontWeight.bold : FontWeight.w300,
        ), onPress: () { widget.button();},
      ),
    );
  }
}
