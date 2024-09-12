import 'package:demo_test/AnimationWidgets/FadeAnimation.dart';
import 'package:demo_test/Helper/CustomColors.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import 'Login.dart';


class WelcomeAuth extends StatefulWidget {
  const WelcomeAuth({Key? key}) : super(key: key);

  @override
  State<WelcomeAuth> createState() => _WelcomeAuthState();
}

class _WelcomeAuthState extends State<WelcomeAuth>  {


  @override
  void initState() {
    super.initState();
    checkUser();
  }

  checkUser() async{
    Future.delayed(const Duration(seconds: 3), ()  async {
      // Navigator.pushReplacement(
      //     context, MaterialPageRoute(builder: (context) => Login()));
      Navigator.push(context, PageTransition(type: PageTransitionType.rightToLeftWithFade, child: Login(),duration: Duration(milliseconds: 500)));
    // await  Navigator.push(context, PageTransition(type: PageTransitionType.rightToLeftPop, duration: Duration(seconds: 1),child: Login(), childCurrent: Login(),));
    });
   /* final SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("token");
    if (token != "" && token != null) {
      Future.delayed(const Duration(seconds: 1), () {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => DashboardTabs(index: 1,)));
      });

    }
    else{
      Future.delayed(const Duration(seconds: 1), () {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Login()));
      });
    }*/
  }


  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: kSoftPink,
      extendBodyBehindAppBar: true,
      body: Center(
        child: Container(
          child: Center(
            child: Fadeanimation(widget: Image.asset('assets/LogoIcon/NanyLogo.png'))
          ),
        ),
      ),
    );
  }
}
