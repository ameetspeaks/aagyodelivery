import 'package:aagyodeliverypartners/const/constContainer.dart';
import 'package:aagyodeliverypartners/const/const_dropdown.dart';
import 'package:flutter/material.dart';
import '../../../../colors/colors_const.dart';
import '../../../../styles/textstyle_const.dart';

class DayWiseEarning extends StatefulWidget {
  const DayWiseEarning({Key? key}) : super(key: key);

  @override
  State<DayWiseEarning> createState() => _DayWiseEarningState();
}

class _DayWiseEarningState extends State<DayWiseEarning> {
  String selectedValue1 = "All";
  String selectedValue2 = "All";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.primary,
          centerTitle: true,
          title: Text(
            "Earning",
            style: AppTextStyles.kBody15SemiboldTextStyle
                .copyWith(color: AppColors.white),
          ),
        ),
        body: Column(
          children: [
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: ConstantContainer(
            //     color: AppColors.primary1,
            //     child: Row(
            //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //       children: [
            //         ConstantContainer(
            //           borderColor: AppColors.white,
            //           borderWidth: 1,
            //           radiusBorder: 5,
            //           child: ConstantDropdown(
            //             dropdownColor: AppColors.white,
            //             textColor: AppColors.white100,
            //             iconColor: AppColors.white100,
            //             options: const ['All','Today', 'Yesterday', 'This Week','This Month'],
            //             selectedOption: selectedValue1,
            //             onChanged: (newValue) {
            //               setState(() {
            //                 selectedValue1 = newValue;
            //               });
            //             },
            //           ),
            //         ),
            //         ConstantContainer(
            //           borderColor: AppColors.primary1,
            //           borderWidth: 1,
            //           radiusBorder: 5,
            //           child: ConstantDropdown(
            //             dropdownColor: AppColors.white,
            //             textColor: AppColors.white100,
            //             iconColor: AppColors.white100,
            //             options: const ['All','CASH', 'WALLET'],
            //             selectedOption: selectedValue2,
            //             onChanged: (newValue) {
            //               setState(() {
            //                 selectedValue2 = newValue;
            //               });
            //             },
            //           ),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
            ListView.builder(
              itemCount: 5,
              physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
              itemBuilder: (context,index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ConstantContainer(
                    color: AppColors.primary1,
                    radiusBorder: 10,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Order Code",
                            style: AppTextStyles.kBody17SemiboldTextStyle
                                .copyWith(color: AppColors.white),
                          ),
                          Text(
                            "20220726",
                            style: AppTextStyles.kBody17SemiboldTextStyle
                                .copyWith(color: AppColors.white40),
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              "₹120",
                              style: AppTextStyles.kBody17SemiboldTextStyle
                                  .copyWith(color: AppColors.white40),
                            ),
                          ),
                          Text(
                            "Payment Mode",
                            style: AppTextStyles.kBody17SemiboldTextStyle
                                .copyWith(color: AppColors.white40),
                          ),
                          Text(
                            "Online",
                            style: AppTextStyles.kBody17SemiboldTextStyle
                                .copyWith(color: AppColors.white40),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }
            )
          ],
        ));
  }
}
