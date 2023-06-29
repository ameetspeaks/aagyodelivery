import 'package:aagyodeliverypartners/colors/colors_const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../styles/textstyle_const.dart';

class SwitchScreen extends StatefulWidget {
  @override
  SwitchClass createState() => new SwitchClass();
}

class SwitchClass extends State {
  bool isSwitched = false;
  var textValue = 'Offline';

  void toggleSwitch(bool value) {

    if(isSwitched == false)
    {
      setState(() {
        isSwitched = true;
        textValue = 'Online';
      });

    }
    else
    {
      setState(() {
        isSwitched = false;
        textValue = 'Offline';
      });

    }
  }
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children:[
          Text('$textValue',style:AppTextStyles.kBody15SemiboldTextStyle.copyWith(color:!isSwitched? Colors.red:Colors.green)),
          Transform.scale(
            scale: 0.58,
            child: CupertinoSwitch(
              onChanged: toggleSwitch,
              value: isSwitched,
              // activeColor: Colors.green,
              thumbColor: Colors.white,
              // activeTrackColor: Colors.white,
            ),
          ),
        ]);
  }
}