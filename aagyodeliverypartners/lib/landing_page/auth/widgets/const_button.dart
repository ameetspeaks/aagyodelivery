import 'package:flutter/material.dart';

import '../../../colors/colors_const.dart';
import '../../../const/constContainer.dart';
import '../../../styles/textstyle_const.dart';

class ConstButton extends StatelessWidget {
  final String text;
  const ConstButton({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ConstantContainer(
      height: size.height*.06,
      width: size.width*.8,
      radiusBorder: 10,
      color: AppColors.primary,
      child: Center(child: Text(text,style: AppTextStyles.kBody15SemiboldTextStyle.copyWith(color: AppColors.white),)),
    );
  }
}
