import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'Utils.dart';

Future customGETAPI(BuildContext context,url) async {
  try {
    final result = await InternetAddress.lookup('example.com');
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      FocusManager.instance.primaryFocus?.unfocus();
      try {
        var response = (await http.get(
          Uri.parse(url),
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': 'Bearer ',
          },
        ));
        if (response.statusCode == 200) {
          var data = json.decode(response.body);
          if (data['code'] == '200') {
            return data;
          } else {
            print("fail");
            return "fail";
          }
        } else {
          print("fail");
          var data = json.decode(response.body);
          return data;
        }
      } catch (e) {
        print("------catch----------: " + e.toString());
      }
    }
  }
  on SocketException catch (_) {
    return (await Utils.InterNetPopUp(context)) ??
        false;
  }
}