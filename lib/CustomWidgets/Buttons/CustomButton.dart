import 'package:flutter/material.dart';

import '../../Helper/CustomColors.dart';

class CustomButton extends StatefulWidget {
  String Text;
  var width;
  final VoidCallback button;
  var buttonColorWhite;
  var size;
  final Color bgColor;
  var height;
  CustomButton(
      {Key? key,
        required this.Text,
        @required this.width,
        required this.button,
        this.size,
        this.bgColor = Colors.pinkAccent,
        this.height,
        this.buttonColorWhite})
      : super(key: key);

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
      child: SizedBox(
        width: widget.width != null ? _width / widget.width : _width,
        height: widget.height != null ? _width / widget.height :  _height / 18,
        child: ElevatedButton(
          onPressed: () {
            widget.button();
          },
          child: FittedBox(
            child: Text(
              widget.Text,
              style: TextStyle(
                  fontFamily: 'Urbanist',
                  fontSize: _height / 60,
                  fontWeight: FontWeight.w500,
                  color: Colors.white),
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
      ),
    );
  }
}
