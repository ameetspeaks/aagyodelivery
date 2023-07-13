import 'package:flutter/material.dart';
import '../../../../../colors/colors_const.dart';
import '../../../../../const/constContainer.dart';
import '../../../../../styles/textstyle_const.dart';


class ConstDropDownProfile extends StatefulWidget {
  const ConstDropDownProfile({Key? key, }) : super(key: key);
  @override
  State<ConstDropDownProfile> createState() => _ConstDropDownProfileState();
}
class _ConstDropDownProfileState extends State<ConstDropDownProfile> {
  String dropdownvalue = "Select Week";
  var items = ['Select Week', 'Select Month', 'Select Year '];
  @override
  Widget build(BuildContext context) {
    return ConstantContainer(
      height: .04,
      width: .29,
      radiusBorder: 5,
      borderColor: AppColors.neutralBorder,
      borderWidth: .5,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child:  DropdownButtonHideUnderline(
          child: DropdownButton(
            // Initial Value
            value: dropdownvalue,
            // Down Arrow Icon
            icon: const Icon(Icons.arrow_drop_down),
            // Array list of items
            items: items.map((String items) {
              return DropdownMenuItem(
                value: items,
                child: Text(
                  items,
                  style: AppTextStyles.kCaption12RegularTextStyle,
                ),
              );
            }).toList(),
            // After selecting the desired option,it will
            // change button value to selected value
            onChanged: (String? newValue) {
              setState(() {
                dropdownvalue = newValue!;
              });
            },
          ),
        ),
      ),
    );
  }

}
