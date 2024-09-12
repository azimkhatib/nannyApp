import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatefulWidget {
  TextEditingController CustomTextController;
  var label;
  var mobilenumber;
  var Charecter;
   CustomTextField({Key? key , required this.CustomTextController,this.label , this.mobilenumber , this.Charecter}) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
   double _height = MediaQuery.of(context).size.height;
   double _width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.0),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(15.0), // Border radius
      ),
      child: TextFormField(
        keyboardType: widget.mobilenumber != null ? TextInputType.number : null,
        maxLength: 10,
        controller: widget.CustomTextController,
        inputFormatters: widget.mobilenumber != null
            ? <TextInputFormatter>[
          LengthLimitingTextInputFormatter(10),
          FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
          FilteringTextInputFormatter.digitsOnly,
        ]
            : widget.Charecter != null
            ? <TextInputFormatter>[
          FilteringTextInputFormatter.allow(RegExp("[0-9a-zA-Z]")),
          FilteringTextInputFormatter.singleLineFormatter,
        ]
            : <TextInputFormatter>[], // Provide an empty list instead of null
        decoration: InputDecoration(
          counterText: '',
          hintText: widget.label,
          hintStyle: TextStyle(
              color: Colors.black38
          ),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(
              horizontal: _height / 50, vertical: _height / 75),
        ),
      ),
    );
  }
}
