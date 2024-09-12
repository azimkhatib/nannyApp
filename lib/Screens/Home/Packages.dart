import 'package:card_loading/card_loading.dart';
import 'package:flutter/material.dart';

import '../../CustomWidgets/Buttons/CustomButton.dart';
import '../../CustomWidgets/Buttons/CustomButtonIcon.dart';
import '../../CustomWidgets/Text/CustomAnimatorText.dart';
import '../../CustomWidgets/Text/CustomText.dart';
import '../../Helper/APICalling.dart';
import '../../Helper/CustomColors.dart';

class Packages extends StatefulWidget {
  const Packages({super.key});

  @override
  State<Packages> createState() => _PackagesState();
}

class _PackagesState extends State<Packages> {
  List Packages = [];
  bool loader = false;

  @override
  void initState() {
    PackagesList();
    super.initState();
  }

  void PackagesList() async {
    setState(() {
      loader = true;
    });
    var data = await customGETAPI(
        context, 'https://www.cgprojects.in/lens8/api/dummy/packages_list');
    setState(() {
      Packages = data['response'];
      loader = false;
    });
    print(Packages.toString());
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
        : Packages.length > 0
            ? Column(
                children: [
                  Container(
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.symmetric(horizontal: _width / 12),
                      child: CustomAnimatorText(
                        Text: 'Packages',
                        TextSize: 20.0,
                      )),
                  SizedBox(
                    height: _height / 50,
                  ),
                  ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: Packages.length,
                      itemBuilder: (context, index) {
                        return Container(
                            height: _height / 5,
                            margin: EdgeInsets.symmetric(
                                horizontal: _width / 12,
                                vertical: _height / 100),
                            decoration: BoxDecoration(
                                border: Border.all(width: 0.5),
                                gradient: LinearGradient(
                                    colors: Packages[index]['price'] == '7497' ? [
                                      Colors.blueAccent,
                                      Colors.lightBlueAccent
                                    ] : [
                                      kSoftPink,
                                      kMidPink,
                                    ],
                                    begin: const FractionalOffset(0.0, 0.0),
                                    end: const FractionalOffset(1.0, 0.0),
                                    tileMode: TileMode.clamp),
                                borderRadius: BorderRadius.all(
                                    Radius.circular(_height / 50))),
                            child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: _width / 15,vertical: _height / 100),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Image.asset(
                                        'assets/Images/Calender.png',
                                        height: _height / 20,
                                      ),
                                      CustomButton(
                                        Text: 'Book Now',
                                        width: 4,
                                        button: () {},
                                        bgColor: Packages[index]['price'] == '7497' ? kDarkBlue : kDarkPink,
                                        height: 12,
                                      )
                                    ],
                                  ),
                                ),

                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: _width / 20),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      CustomText(
                                        Text: Packages[index]['title'],
                                        bgColor: kDarkBlue,
                                        Bold: true,
                                      ),
                                      CustomText(
                                        Text: Packages[index]['price'],
                                        bgColor: kDarkBlue,
                                        Bold: true,
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: _width / 25),
                                  child: CustomText(
                                    Text:Packages[index]['desc'],
                                    TextSize: 9.0,
                                  ),
                                ),
                              ],
                            ));
                      })
                ],
              )
            : SizedBox.shrink();
  }
}
