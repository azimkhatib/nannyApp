import 'package:flutter/material.dart';

import '../../Helper/CustomColors.dart';

class CustomButtonIcon extends StatefulWidget {
  String Text;
  var width;
  final VoidCallback button;
  var buttonColorWhite;
  var size;
  final Color bgColor;
  final IconData icon;
  var height;
  CustomButtonIcon(
      {Key? key,
        required this.Text,
        @required this.width,
        required this.button,
        this.size,
        this.bgColor = Colors.pinkAccent,
        required this.icon,
        this.height,
        this.buttonColorWhite})
      : super(key: key);

  @override
  State<CustomButtonIcon> createState() => _CustomButtonIconState();
}

class _CustomButtonIconState extends State<CustomButtonIcon> {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return SizedBox(
      width: widget.width != null ? _width / widget.width : _width,
      height: widget.height != null ? _width / widget.height :  _height / 18,
      child: ElevatedButton(
        onPressed: () {
          widget.button();
        },
        child: FittedBox(
          child: Row(
            children: [
              Icon(widget.icon,color: Colors.white,size: _height / 75,),
              Text(
                widget.Text,
                style: TextStyle(
                    fontFamily: 'Urbanist',
                    fontSize: _height / 100,
                    color: Colors.white),
              ),
            ],
          ),
        ),
        style: ElevatedButton.styleFrom(
          elevation: 10.0,
          side: BorderSide(
            width: widget.buttonColorWhite != null ? 2.0 : 0.0,
            color: widget.buttonColorWhite != null ? Colors.black : buttonColor,
          ),
          backgroundColor:
          widget.buttonColorWhite != null ? Colors.white : widget.bgColor,
          textStyle: TextStyle(fontSize: 14, fontStyle: FontStyle.normal),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0)),
        ),
      ),
    );
  }
}
