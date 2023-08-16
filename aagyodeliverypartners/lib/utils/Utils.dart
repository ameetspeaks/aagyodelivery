import 'package:aagyodeliverypartners/colors/colors_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../styles/textstyle_const.dart';

class Utils{

  //for circular indicator
  static bool isloading = false;

  static void  goTo(BuildContext context, Widget nextScreen) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => nextScreen,
        ));
  }

  static   nevergoTo(BuildContext context, Widget nextScreen) {
    Get.offAll(nextScreen);
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

  static Future<void> openMap(String location) async {

    String googleUrl = "https://www.google.com/maps/search/$location";
    final Uri _url = Uri.parse(googleUrl);


    try{

      if (!await launchUrl(_url)) {
        throw Exception('Could not launch $_url');
      }
    }catch(e){
      Utils.showToastMsg("Something went wrong");
    }
  }

  Widget progressIndicator(BuildContext context){
    return Center(child:CircularProgressIndicator(
      backgroundColor: AppColors.primary,
      color: Colors.white,
    ));
  }

}