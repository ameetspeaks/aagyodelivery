import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

class Utils{

  static void  goTo(BuildContext context, Widget nextScreen) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => nextScreen,
        ));
  }

  static Future<void> callNumber(String number) async{

    await FlutterPhoneDirectCaller.callNumber(number);
  }
}