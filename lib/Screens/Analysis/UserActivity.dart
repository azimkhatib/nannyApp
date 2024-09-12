import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../CustomWidgets/Text/CustomText.dart';

class Useractivity extends StatefulWidget {
  const Useractivity({super.key});

  @override
  State<Useractivity> createState() => _UseractivityState();
}

class _UseractivityState extends State<Useractivity> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Container(
              child: ListTile(
                tileColor: Colors.red,
                contentPadding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 10.0), // Further reduced padding
                subtitle: CustomText(Text: 'Text'),
                leading: CustomText(Text: 'Hello'),
                title: CustomText(Text: 'Testing'),
                trailing: SizedBox(
                  height: 200,
                  child: CircularPercentIndicator(
                    radius: 25.0, // Further reduced radius
                    lineWidth: 4.0, // Slightly thinner line
                    animation: true,
                    percent: 0.8,
                    center: Text(
                      "80.0%",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10.0), // Reduced font size
                    ),
                    circularStrokeCap: CircularStrokeCap.round,
                    progressColor: Colors.purple,
                  ),
                ),
              ),
            ) , Container(
              child: ListTile(
                tileColor: Colors.yellow,
                contentPadding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 10.0), // Further reduced padding
                subtitle: CustomText(Text: 'Text'),
                leading: CustomText(Text: 'Hello'),
                title: CustomText(Text: 'Testing'),
                trailing: SizedBox(
                  height: 200,
                  child: CircularPercentIndicator(
                    radius: 25.0, // Further reduced radius
                    lineWidth: 4.0, // Slightly thinner line
                    animation: true,
                    percent: 0.5,
                    center: Text(
                      "50.0%",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10.0), // Reuced font size
                    ),
                    circularStrokeCap: CircularStrokeCap.round,
                    progressColor: Colors.purple,
                  ),
                ),
              ),
            ), Container(
              child: ListTile(
                tileColor: Colors.green,
                contentPadding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 10.0), // Further reduced padding
                subtitle: CustomText(Text: 'Text'),
                leading: CustomText(Text: 'Hello'),
                title: CustomText(Text: 'Testing'),
                trailing: SizedBox(
                  height: 200,
                  child: CircularPercentIndicator(
                    radius: 25.0, // Further reduced radius
                    lineWidth: 4.0, // Slightly thinner line
                    animation: true,
                    percent: 0.2,
                    center: Text(
                      "20.0%",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10.0), // Reduced font size
                    ),
                    circularStrokeCap: CircularStrokeCap.round,
                    progressColor: Colors.purple,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
