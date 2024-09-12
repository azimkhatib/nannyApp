import 'package:card_loading/card_loading.dart';
import 'package:demo_test/Helper/APICalling.dart';
import 'package:demo_test/Screens/Home/Packages.dart';
import 'package:flutter/material.dart';

import '../../CustomWidgets/Buttons/CustomButton.dart';
import '../../CustomWidgets/Buttons/CustomButtonIcon.dart';
import '../../CustomWidgets/Text/CustomAnimatorText.dart';
import '../../CustomWidgets/Text/CustomText.dart';
import '../../Helper/CustomColors.dart';

class Currentbooking extends StatefulWidget {
  const Currentbooking({super.key});

  @override
  State<Currentbooking> createState() => _CurrentbookingState();
}

class _CurrentbookingState extends State<Currentbooking> {
  List Booking = [];
  bool loader = false;

  @override
  void initState() {
    currentPackages();
    super.initState();
  }

  void currentPackages() async {
    setState(() {
      loader = true;
    });
    var data = await customGETAPI(context,
        'https://www.cgprojects.in/lens8/api/dummy/current_booking_list');
    setState(() {
      Booking = data['response'];
      loader = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    return loader
        ? CardLoading(
            height: _height / 3.7,
            borderRadius: BorderRadius.all(Radius.circular(_height / 75)),
            margin: EdgeInsets.symmetric(horizontal: _width / 15),
          )
        : Booking.length > 0
            ? Column(
                children: [
                  Container(
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.symmetric(horizontal: _width / 12),
                      child: CustomAnimatorText(
                        Text: 'Your Current Booking',
                        TextSize: 20.0,
                      )),
                  SizedBox(
                    height: _height / 50,
                  ),
                  ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: Booking.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.symmetric(horizontal: _width / 15),
                          decoration: BoxDecoration(
                            color: Color(0xFFffffff),
                            borderRadius:
                                BorderRadius.all(Radius.circular(_height / 75)),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                blurRadius: 5.0, // soften the shadow
                                spreadRadius: 1.0, //extend the shadow
                                offset: Offset(
                                  5.0, // Move to right 5  horizontally
                                  5.0, // Move to bottom 5 Vertically
                                ),
                              )
                            ],
                          ),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  CustomText(
                                    Text: Booking[index]['title'],
                                    bgColor: kDarkPink,
                                    Bold: true,
                                  ),
                                  CustomButton(
                                    Text: 'Start',
                                    width: 3,
                                    button: () {},
                                    bgColor: kDarkPink,
                                    height: 15,
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CustomText(
                                        Text: 'From',
                                        padding: false,
                                      ),
                                      Row(
                                        children: [
                                          Icon(Icons.calendar_month_outlined,
                                              color: kDarkPink),
                                          CustomText(Text: Booking[index]['from_date'])
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Icon(Icons.access_time_outlined,
                                              color: kDarkPink),
                                          CustomText(
                                            Text: Booking[index]['from_time'],
                                            padding: false,
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CustomText(Text: 'To', padding: false),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.calendar_month_outlined,
                                            color: kDarkPink,
                                          ),
                                          CustomText(Text: Booking[index]['to_date'])
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Icon(Icons.access_time_outlined,
                                              color: kDarkPink),
                                          CustomText(
                                              Text: Booking[index]['to_time'], padding: false)
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: _height / 75,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  CustomButtonIcon(
                                    Text: 'Rate Us',
                                    width: 4.5,
                                    button: () {},
                                    icon: Icons.star_border_outlined,
                                    height: 18,
                                    bgColor: kDarkBlue,
                                  ),
                                  CustomButtonIcon(
                                    Text: 'Geolocation',
                                    width: 4,
                                    button: () {},
                                    icon: Icons.pin_drop_outlined,
                                    height: 18,
                                    bgColor: kDarkBlue,
                                  ),
                                  CustomButtonIcon(
                                    Text: 'Survillence',
                                    width: 4,
                                    button: () {},
                                    icon: Icons.mic_none_outlined,
                                    height: 18,
                                    bgColor: kDarkBlue,
                                  )
                                ],
                              ),
                              SizedBox(
                                height: _height / 50,
                              )
                            ],
                          ),
                        );
                      })
                ],
              )
            : SizedBox.shrink();
  }
}
