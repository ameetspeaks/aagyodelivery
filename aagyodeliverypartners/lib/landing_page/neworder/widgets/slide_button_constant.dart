import 'package:aagyodeliverypartners/colors/colors_const.dart';
import 'package:aagyodeliverypartners/styles/textstyle_const.dart';
import 'package:aagyodeliverypartners/utils/Utils.dart';
import 'package:flutter/material.dart';
import 'package:slider_button/slider_button.dart';


class SliderButtonConst extends StatelessWidget {
  final String text;
  final Widget widget;

  const SliderButtonConst({super.key, required this.text, required this.widget});

  @override
  Widget build(BuildContext context) {
    return Center(child: SliderButton(
      height: 60,
      baseColor: AppColors.white,
        highlightedColor: AppColors.white80,
        radius: 40,
        buttonColor: AppColors.white30,
        backgroundColor: AppColors.primary,
        action: () {
          ///Do something here
          Utils.nevergoTo(context, widget
          );
        },
        label: Text(
          textAlign:TextAlign.left,
            text,
            style: AppTextStyles.kBody15SemiboldTextStyle
        ),
        icon:Icon(Icons.arrow_forward_ios,size: 20,color: AppColors.white100,)


    ));
  }
}
