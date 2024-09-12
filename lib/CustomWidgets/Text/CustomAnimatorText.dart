import 'package:demo_test/Helper/CustomColors.dart';
import 'package:flutter/material.dart';
import 'package:widget_and_text_animator/widget_and_text_animator.dart';

class CustomAnimatorText extends StatefulWidget {
  String Text;
  var TextSize;
   CustomAnimatorText({Key? key , required this.Text , this.TextSize}) : super(key: key);

  @override
  State<CustomAnimatorText> createState() => _CustomAnimatorTextState();
}

class _CustomAnimatorTextState extends State<CustomAnimatorText> {
  @override
  Widget build(BuildContext context) {
    return TextAnimator(widget.Text,style: TextStyle(
        fontSize: widget.TextSize != null ? widget.TextSize : 17.0,
        fontWeight: FontWeight.bold,
        fontFamily: 'Alegreya Sans',
      color: kDarkBlue
    ),
      // incomingEffect: WidgetTransitionEffects.incomingScaleDown(),
      // atRestEffect: WidgetRestingEffects.bounce(),
      outgoingEffect: WidgetTransitionEffects.outgoingScaleUp(),
    );
  }
}
