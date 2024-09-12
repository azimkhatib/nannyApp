import 'package:flutter/material.dart';

class AnimationOpacity extends StatefulWidget {
  Widget widget;
   AnimationOpacity({super.key , required this.widget});

  @override
  State<AnimationOpacity> createState() => AnimationOpacityState();
}

class AnimationOpacityState extends State<AnimationOpacity> {
  double opacityLevel = 1.0;

  @override
  void initState() {
    // TODO: implement initState
    Future.delayed(Duration(seconds: 1),(){
      setState(() => opacityLevel = opacityLevel == 0 ? 1.0 : 0.0);
    });
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        AnimatedOpacity(
          opacity: opacityLevel,
          duration:  Duration(seconds: 3),
          child: widget.widget,
        ),
      ],
    );
  }
}
