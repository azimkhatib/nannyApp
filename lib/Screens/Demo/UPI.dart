import 'package:flutter/material.dart';
import 'package:flutter_upi_pay/Src/payment.dart';

class UPI extends StatefulWidget {
  const UPI({super.key});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".


  @override
  State<UPI> createState() => _UPIState();
}

class _UPIState extends State<UPI> {
  FlutterPayment flutterPayment = FlutterPayment();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the UPI object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text('UPI Payment'),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Initiate UPI payment from Flutter',
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          flutterPayment.launchUpi(
              upiId: "8446527846@ybl",
              name: "tester",
              amount: "1",
              message: "test",
              currency: "INR");
        },
        tooltip: '',
        child: const Icon(Icons.monetization_on_outlined),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}