import 'package:flutter/material.dart';
import '../../../colors/colors_const.dart';
import '../../../styles/textstyle_const.dart';

class ConstTextfield extends StatelessWidget {
  final TextStyle? style;
  final TextStyle? hintstyle;
  final Color? enableBorderColor;
  final TextEditingController ?controller;
  final Widget? suffix;
  final TextInputType? inputtype;
  final int? maxlength;
  final int? maxline;
  final String hinttext;
  final bool ?obscure;
  final bool ?readyonly;
  final IconButton? suffixicon;
  final FormFieldValidator? validator;
  final EdgeInsetsGeometry? contentPadding;
  final VoidCallback ?ontap;

  const ConstTextfield(
      {Key? key,
        this.controller,
        this.inputtype,
        this.maxlength,
        required this.hinttext,
        this.suffixicon,
        this.validator,
         this.obscure, this.contentPadding, this.maxline, this.readyonly, this.suffix, this.ontap, this.style, this.enableBorderColor, this.hintstyle, })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: ontap,
      readOnly: readyonly??false,
        validator: validator,
        controller: controller,
        keyboardType: inputtype,
        obscureText: obscure??false,
        cursorColor: AppColors.primary,
        maxLength: maxlength,
        maxLines: maxline,
        cursorHeight: 20,
        style:style ?? AppTextStyles.kBody17SemiboldTextStyle
            .copyWith(color: AppColors.primary),
        decoration: InputDecoration(
          suffix: suffix,
          suffixIcon: suffixicon,
          hintText: hinttext,
          hintStyle:  hintstyle??AppTextStyles.kCaption12RegularTextStyle
              .copyWith(color: AppColors.white50),
          counter: Offstage(),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            borderSide: BorderSide(color:enableBorderColor??AppColors.white60 ,width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            borderSide: BorderSide(color: AppColors.primary, width: 1),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.white60),
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            borderSide: BorderSide(color: Color(0xFFF65054)),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            borderSide: BorderSide(color: Color(0xFFF65054)),
          ),
          contentPadding: EdgeInsets.only(left: 10,right: 8),
        ),
    );
  }
}