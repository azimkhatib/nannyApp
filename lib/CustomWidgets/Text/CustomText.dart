import 'package:flutter/material.dart';

class CustomText extends StatefulWidget {
  String Text;
  var TextSize;
  var Bold;
  var padding;
  final Color bgColor;

   CustomText({Key? key , required this.Text,this.TextSize , this.Bold ,this.padding,  this.bgColor = const Color(0xFF000000),}) : super(key: key);

  @override
  State<CustomText> createState() => _CustomTextState();
}

class _CustomTextState extends State<CustomText> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.all( widget.padding != null ? 0.0 : 8.0),
      child: Text(widget.Text,
        style: TextStyle(
            color: widget.bgColor ,
            fontFamily: 'Alegreya Sans',
            fontSize: widget.TextSize != null ? widget.TextSize : 17.0,
            fontWeight: widget.Bold != null ? FontWeight.bold : null
        ),),
    );
  }
}
