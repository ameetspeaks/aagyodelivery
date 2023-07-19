import 'package:aagyodeliverypartners/colors/colors_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../styles/textstyle_const.dart';

class Utils{

  //for online offline button
  static bool pressed = false;

  static void  goTo(BuildContext context, Widget nextScreen) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => nextScreen,
        ));
  }

  static void  nevergoTo(BuildContext context, Widget nextScreen) {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => nextScreen,
        ));
  }

  static Future<void> callNumber(String number) async{

    await FlutterPhoneDirectCaller.callNumber(number);
  }

  static DialogBox(BuildContext context ,String title,String content,Widget widget){
    showDialog(context: context, builder: (context)=>AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: [
        TextButton(
          child: Text('Cancel',style: AppTextStyles.kBody15SemiboldTextStyle.copyWith(color: AppColors.white100),),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        widget,
      ],
    ));
  }

  static PopUP(BuildContext context ,String title,){
    showDialog(context: context, builder: (context)=>AlertDialog(
      title: Text(title),
    ));
  }

  static void showToastMsg(String? msg, {bool isErrorType = false}) {
    Fluttertoast.showToast(
        msg: msg!,
        backgroundColor: isErrorType ? Colors.red : Colors.green,
        textColor: Colors.white,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 5);
  }

}