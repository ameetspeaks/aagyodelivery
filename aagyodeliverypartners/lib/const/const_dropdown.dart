import 'package:aagyodeliverypartners/colors/colors_const.dart';
import 'package:aagyodeliverypartners/styles/textstyle_const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ConstantDropdown extends StatefulWidget {
  final List<String> options;
  final String selectedOption;
  final ValueChanged onChanged;
  final Color iconColor;
  final Color dropdownColor;
  final Color textColor;

   ConstantDropdown({

    required this.options,
    required this.selectedOption,
    required this.onChanged, required this.iconColor, required this.dropdownColor, required this.textColor,
  });

  @override
  State<ConstantDropdown> createState() => _ConstantDropdownState();
}

class _ConstantDropdownState extends State<ConstantDropdown> {
  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton<String>(
        dropdownColor: widget.dropdownColor,
        value: widget.selectedOption,
        onChanged: widget.onChanged,
        icon: const Icon(CupertinoIcons.chevron_down),
        iconSize: 15,
        iconEnabledColor: widget.iconColor,
        items: widget.options.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value,style: AppTextStyles.kBody15SemiboldTextStyle.copyWith(color: widget.textColor),),
          );
        }).toList(),
      ),
    );
  }
}
