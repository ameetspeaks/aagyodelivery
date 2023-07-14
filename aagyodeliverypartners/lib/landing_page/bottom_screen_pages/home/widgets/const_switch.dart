import 'package:aagyodeliverypartners/colors/colors_const.dart';
import 'package:aagyodeliverypartners/const/constContainer.dart';
import 'package:aagyodeliverypartners/styles/textstyle_const.dart';
import 'package:aagyodeliverypartners/utils/Utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ConstSwitch extends StatefulWidget {
  const ConstSwitch({Key? key}) : super(key: key);

  @override
  State<ConstSwitch> createState() => _ConstSwitchState();
}

class _ConstSwitchState extends State<ConstSwitch> {
  bool ispressed = false;
  var textValue = '🤨';

  void toggleSwitch(bool value) {
    if (ispressed == false) {
      setState(() {
        ispressed = true;
        textValue = '😎';
      });
    } else {
      setState(() {
        ispressed = false;
        textValue = '🤨';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('$textValue', style: AppTextStyles.kHeading1TextStyle),
        InkWell(
            onTap: () {
              setState(() {
                toggleSwitch(true);
              });
            },
            child: ConstantContainer(
                height: 30,
                width: 50,
                color: !ispressed ? AppColors.secondary1 : AppColors.sucess100,
                borderColor: AppColors.white,
                radiusBorder: 5,
                child: Center(
                    child: Text(
                  !ispressed ? "Offline" : "Online",
                  style: AppTextStyles.kCaption12SemiboldTextStyle
                      .copyWith(color: AppColors.white),
                ))))
      ],
    );
  }
}
