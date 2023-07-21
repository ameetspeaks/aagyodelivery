import 'package:flutter/material.dart';
import '../../../colors/colors_const.dart';
import '../../../styles/textstyle_const.dart';

class ConstTextfield extends StatelessWidget {
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

  const ConstTextfield(
      {Key? key,
        this.controller,
        this.inputtype,
        this.maxlength,
        required this.hinttext,
        this.suffixicon,
        this.validator,
         this.obscure, this.contentPadding, this.maxline, this.readyonly, this.suffix, })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: readyonly??false,
        validator: validator,
        controller: controller,
        keyboardType: inputtype,
        obscureText: obscure??false,
        cursorColor: AppColors.primary,
        maxLength: maxlength,
        maxLines: maxline,
        cursorHeight: 20,
        style: AppTextStyles.kBody17SemiboldTextStyle
            .copyWith(color: AppColors.primary),
        decoration: InputDecoration(
          contentPadding: contentPadding,
          hintStyle: AppTextStyles.kCaption12RegularTextStyle
              .copyWith(color: AppColors.white80),
          suffix: suffix,

          suffixIcon: suffixicon,
          counterText: "",
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(
                color: AppColors.white50
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(
              color: AppColors.primary,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(
              color: Colors.red,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(
              color: Colors.red,
            ),
          ),
          border: const OutlineInputBorder(),
          hintText: hinttext,
        ));
  }
}