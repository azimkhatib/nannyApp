import 'package:flutter/material.dart';
import '../../CustomWidgets/Buttons/CustomButton.dart';
import '../../CustomWidgets/Text/CustomShakeText.dart';
import '../../Helper/Utils.dart';

class Nointernetconnection extends StatefulWidget {
  const Nointernetconnection({super.key});

  @override
  State<Nointernetconnection> createState() => _NointernetconnectionState();
}

class _NointernetconnectionState extends State<Nointernetconnection> with SingleTickerProviderStateMixin {

  bool loader = false;

  void checkInternet(){
    setState(() {
      setState(() {
        loader = true;
      });
    });
    Future.delayed(Duration(seconds: 4),() async{
      setState(() {
        loader = false;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: _height / 10,),
                Image.asset('assets/Images/oops.png',height: _height / 5,),
                Image.asset('assets/Images/no-internet.png',height: _height / 3,),
                SizedBox(height: _height / 50,),
                CustomShakeTextWidget(Text: 'Please Check your internet'),
                SizedBox(height: _height / 50,),
                CustomButton(Text: 'Retry', width: 2, button: (){
                  checkInternet();
                })
              ],
            ),
          ),
          loader ? Utils.LoaderNew(_height) : SizedBox.shrink()
        ],
      )

    );
  }
}
