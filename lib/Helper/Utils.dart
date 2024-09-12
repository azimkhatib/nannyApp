import 'package:flutter/material.dart';
class Utils {
  static commanToster(text, context) {
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: Duration(seconds: 2),
      content: Text(text),
    ));
  }

  static LoaderNew(_height) {
    return Container(
        color: Colors.white54,
        height: _height,
        child: Center(child: Image.asset('assets/GIF/loader.gif'),));
  }
  static InterNetPopUp(context) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: new Text('Please check your connection'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.of(context).pop(false), //<-- SEE HERE
            child: new Text('Okay'),
          ),
        ],
      ),
    );
  }
}
