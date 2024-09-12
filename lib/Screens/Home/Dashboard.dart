import 'package:animate_gradient/animate_gradient.dart';
import 'package:demo_test/CustomWidgets/Buttons/AnimatedButton.dart';
import 'package:demo_test/CustomWidgets/Buttons/CustomButton.dart';
import 'package:demo_test/CustomWidgets/Buttons/CustomButtonIcon.dart';
import 'package:demo_test/CustomWidgets/Text/CustomAnimatorText.dart';
import 'package:demo_test/CustomWidgets/Text/CustomText.dart';
import 'package:demo_test/Helper/CustomColors.dart';
import 'package:demo_test/Screens/Home/Drawer.dart';
import 'package:demo_test/Screens/Home/Packages.dart';
import 'package:flutter/material.dart';
import '../../AnimationWidgets/ButtonBlinker.dart';
import '../../AnimationWidgets/SlideAnimation.dart';
import '../../Helper/CustomColors.dart';
import 'CurrentBooking.dart';
class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> with SingleTickerProviderStateMixin {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    return Scaffold(
    appBar: AppBar(
      backgroundColor: Colors.white,
      automaticallyImplyLeading: false,
      actions: <Widget>[
        Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: Icon(
                Icons.menu,
                color: kDarkPink,
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer(); // Now this context contains a Scaffold ancestor
              },
            );
          },
        ),
      ],
    ),
    drawer: DrawerScreen(),
      backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        maxRadius: _height / 20,
                        backgroundImage: AssetImage('assets/Images/Profile.png'),),
                      title: CustomText(Text: 'Welcome',bgColor: kDarkBlue,Bold: true,padding: false,),
                      subtitle: CustomText(Text: 'Emily Cyrus',bgColor: kDarkPink,Bold: true,padding: false,),
                    ),
                    SizedBox(height: _height / 30,),
                    Container(
                        height: _height / 5,
                        width: _width / 1.2,
                        decoration: BoxDecoration(
                            border: Border.all(width: 0.5),
                            gradient: LinearGradient(
                                colors: [
                                  kSoftPink,
                                  kMidPink,
                                  kDarkPink,
                                ],
                                begin: const FractionalOffset(0.0, 0.0),
                                end: const FractionalOffset(1.0, 0.0),
                                tileMode: TileMode.clamp),
                            borderRadius: BorderRadius.all(Radius.circular(_height / 50))),
                      child: Container(
                        alignment: Alignment.bottomLeft,
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: _height / 20,),
                            CustomText(Text: 'Nanny And \nBabysitting Services',bgColor: kDarkBlue,Bold: true,TextSize: 18.0,),
                            CustomAnimatedButton(text: 'Book Now', button: (){},width: 4,bold: true,height: 15,)
                          ],
                        ),
                      )

                    ),
                    SizedBox(height: _height / 25,),
                    Currentbooking(),
                    SizedBox(height: _height / 25,),
                    Packages(),
                    SizedBox(height: _height / 20,)
                  ],
                ),
              ),
              SlideAnimation(
                widget: Padding(
                  padding: EdgeInsets.only(top: _height / 16,left: _width / 2),
                  child: Container(
                    height: _height / 3.3,
                    child: Image.asset('assets/LogoIcon/NanyLogo.png',height: _height / 3,fit: BoxFit.fitHeight,),
                  ),
                ),
              ),
            ],
          ),
        )
    );
  }
}



// AnimateGradient(
// animateAlignments: false,
// primaryBegin: Alignment.centerLeft,
// primaryEnd: Alignment.centerRight,
// duration: Duration(seconds: 5),
// primaryColors: [
// kDarkPink,
// kMidPink,
// kSoftPink,
// ],
// secondaryColors: [
// kSoftPink,
// kMidPink,
// kDarkPink,
// ],
// child: Container(
// height: _height / 3,
// width: _width,
// decoration: BoxDecoration(
// border: Border.all(width: 0.5),
// borderRadius: BorderRadius.only(bottomLeft: Radius.circular(_height / 25),bottomRight: Radius.circular(_height / 25))
// ),
// ),
// ),