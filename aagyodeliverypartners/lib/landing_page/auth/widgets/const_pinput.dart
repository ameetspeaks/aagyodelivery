import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import '../../../colors/colors_const.dart';

class ConstPinPut extends StatelessWidget {
  final TextEditingController ?controller;
  final FormFieldValidator<String>? validator;
  final bool obsure;
  final int totallength;
  const ConstPinPut({Key? key, required this.totallength,  this.controller, this.validator, required this.obsure}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 46,
      height: 46,
      textStyle: const TextStyle(
          fontSize: 30, color: AppColors.primary, fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: AppColors.white70),
        borderRadius: BorderRadius.circular(10),
      ),
    );
    return Pinput(
      controller: controller,
      validator: validator,
      obscureText: obsure,
      mainAxisAlignment: MainAxisAlignment.center,
      length: totallength,
      onChanged: (text) {
        // code = text;
      },
        preFilledWidget: Text('*'),
      defaultPinTheme: defaultPinTheme,
    );
  }
}
