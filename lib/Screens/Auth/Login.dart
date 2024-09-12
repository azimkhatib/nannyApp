import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import '../../CustomWidgets/Buttons/AnimatedButton.dart';
import '../../CustomWidgets/Buttons/AnimatedDisbleButton.dart';
import '../../CustomWidgets/Buttons/CustomButton.dart';
import '../../CustomWidgets/Text/CustomAnimatorText.dart';
import '../../CustomWidgets/Text/CustomText.dart';
import '../../CustomWidgets/TextField/CustomTextField.dart';
import '../../CustomWidgets/Text/CustomShakeText.dart';
import '../../Helper/Utils.dart';
import '../Home/Dashboard.dart';
import '../Home/HomeTabbar.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> with SingleTickerProviderStateMixin {
  bool isLogin = false;
  TextEditingController mobilenumber = TextEditingController();
  bool invalidMobileShowText = false;
  bool mobileNumberValid = false;
  bool Loader = false;
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    // Add a listener to the controller to listen for changes
    mobilenumber.addListener(() {
      setState(() {
        mobileNumberValid = mobilenumber.text.length == 10;
      });
      if(mobilenumber.text.length == 10){
        FocusManager.instance.primaryFocus?.unfocus();
      }
    });
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
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                AnimatedContainer(
                  width: _width,
                  height: _height,
                  decoration: BoxDecoration(
                      color: isLogin ? Colors.white : Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(15.0))),
                  alignment:
                  isLogin ? Alignment.center : AlignmentDirectional.topCenter,
                  duration: const Duration(seconds: 2),
                  curve: Curves.fastOutSlowIn,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: AnimatedContainer(
                          height: isLogin ? _height / 2.5 : _height / 1.7,
                          duration: const Duration(seconds: 2),
                          child: Container(
                            child: Image.asset(
                              'assets/Images/Login.jpg',
                              height: isLogin ? _height / 2 : _height / 1.5,
                              width: _width,
                              fit: BoxFit.fitHeight,
                            ),
                          ),
                        ),
                      ),
                      isLogin
                          ? Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: CustomAnimatorText(
                              Text: 'Login',TextSize: _height / 20,),
                          ),
                          SizedBox(height: _height / 75,),
                          invalidMobileShowText ?
                          CustomShakeTextWidget(Text: 'Please enter mobile number',Bold: true,bgColor: Colors.red,)
                          :  CustomText(Text: 'Please enter mobile number',Bold: true,),
                          SizedBox(height: _height / 60,),
                          CustomTextField(CustomTextController: mobilenumber,label: 'Mobile number',mobilenumber: true,),
                          SizedBox(height: _height / 50,),
                          mobileNumberValid ?
                          CustomAnimatedButton(
                            text: 'Agree and Continue',
                            width: 1,
                            bold: true,
                            button: () {

                              setState(() {
                                Loader = true;
                              });
                              Future.delayed(const Duration(seconds: 3), () async{
                                setState(() {
                                  Loader = false;
                                });
                                await Navigator.push(context, PageTransition(type: PageTransitionType.rightToLeftPop, duration: Duration(seconds: 1),child: HomeTabbar(), childCurrent: Login()));
                                // await Navigator.push(context, MaterialPageRoute(builder: (context) => Dashboard()));
                              });
                            },
                          )
                          // CustomButton(Text: 'Login',button: (){
                          //   Navigator.push(context, MaterialPageRoute(builder: (context) => Dashboard()));
                          // },)
                              :   CustomAnimatedDisableButton(text: 'Agree and Continue',bold: true,button: (){
                                setState(() {
                                  invalidMobileShowText = true;
                                });
                          }),
                        ],
                      )
                          : Column(
                        children: [
                          CustomText(
                              Text: 'Welcome to the app', TextSize: 30.0),
                          Padding(
                            padding:  EdgeInsets.symmetric(horizontal: _width / 20),
                            child: CustomText(
                                Text:
                                "Welcome to our app! We're thrilled to have you here. Explore, connect, and enjoy a seamless experience. Your journey to something amazing starts now!"),
                          ),
                          SizedBox(height: _height / 50),
                          CustomButton(Text: 'Start', width: 1.2, button: (){
                            setState(() {
                              isLogin = !isLogin;
                            });
                          },size: _height / 40),
                        ],
                      ),
                    ],
                  ),
                ),

              ],
            ),
          ),
          Loader ? Utils.LoaderNew(_height) : SizedBox.shrink()
        ],
      )
    );
  }
}
