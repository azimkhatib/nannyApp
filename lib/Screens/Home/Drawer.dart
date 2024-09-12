import 'package:flutter/material.dart';

import '../../CustomWidgets/Text/CustomText.dart';
import '../../Helper/CustomColors.dart';

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({super.key});

  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    return Drawer(
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: _width / 10),
        child: Column(
          children: [
            SizedBox(height: _height / 10,),
            CircleAvatar(
              maxRadius: _height / 20,
              backgroundImage: AssetImage('assets/Images/Profile.png'),),
            SizedBox(height: _height / 50,),
              CustomText(Text: 'Emily Cyrus',bgColor: kDarkPink,Bold: true,padding: false,),
            SizedBox(height: _height / 20,),
            CustomText(Text: 'Home',bgColor: kDarkBlue,Bold: true,),
            Divider(color: kDarkPink,),
            CustomText(Text: 'Book Nany',bgColor: kDarkBlue,Bold: true,),
            Divider(color: kDarkPink,),
            CustomText(Text: 'How It Works',bgColor: kDarkBlue,Bold: true,),
            Divider(color: kDarkPink,),
            CustomText(Text: 'Why Nanny Vanny',bgColor: kDarkBlue,Bold: true,),
            Divider(color: kDarkPink,),
            CustomText(Text: 'My Bookings',bgColor: kDarkBlue,Bold: true,),
            Divider(color: kDarkPink,),
            CustomText(Text: 'My Profile',bgColor: kDarkBlue,Bold: true,),
            Divider(color: kDarkPink,),
            CustomText(Text: 'Support',bgColor: kDarkBlue,Bold: true,),
          ],
        ),
      ),
    );
  }
}
