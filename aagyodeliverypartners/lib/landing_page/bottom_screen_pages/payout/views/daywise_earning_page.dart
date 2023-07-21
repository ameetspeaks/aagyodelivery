import 'package:aagyodeliverypartners/const/constContainer.dart';
import 'package:flutter/cupertino.dart';
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
  int page =10;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
        body: NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (notification) {
            notification.disallowIndicator();
            return true;
          },
          child: ListView.builder(
            itemCount: page,
            physics: ScrollPhysics(),
              shrinkWrap: true,
            itemBuilder: (context,index) {
              return index<page-1
             ?  Padding(
                padding: const EdgeInsets.all(8.0),
                child: ConstantContainer(
                  color: AppColors.primary1,
                  radiusBorder: 10,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              "Order No.13455",
                              style: AppTextStyles.kBody15SemiboldTextStyle
                                  .copyWith(color: AppColors.white),
                            ),
                            Spacer(),
                            Icon(
                              CupertinoIcons.calendar_today,
                                color: AppColors.white
                            ),
                            Text(
                              "10 Jul 2023",
                              style: AppTextStyles.kSmall10RegularTextStyle
                                  .copyWith(color: AppColors.white),
                            ),
                            Icon(
                              CupertinoIcons.time,color: AppColors.white
                            ),
                            Text(
                              "08:55PM",
                              style: AppTextStyles.kSmall10RegularTextStyle
                                  .copyWith(color: AppColors.white),
                            ),
                          ],
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            "₹120",
                            style: AppTextStyles.kBody17SemiboldTextStyle
                                .copyWith(color: AppColors.white40),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Source",
                              style: AppTextStyles.kBody17SemiboldTextStyle
                                  .copyWith(color: AppColors.white10),
                            ),
                            Spacer(),
                            Text(
                              "Destination",
                              style: AppTextStyles.kBody17SemiboldTextStyle
                                  .copyWith(color: AppColors.white10),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Tedhi Puliya",
                              style: AppTextStyles.kBody15RegularTextStyle
                                  .copyWith(color: AppColors.white30),
                            ),
                            Text(
                              "7 Km",
                              style: AppTextStyles.kBody15SemiboldTextStyle
                                  .copyWith(color: AppColors.white30),
                            ),
                            Text(
                              "Munshi Puliya",
                              style: AppTextStyles.kBody15RegularTextStyle
                                  .copyWith(color: AppColors.white30),
                            ),
                          ],
                        ),
                        Text(
                          "Payment Mode",
                          style: AppTextStyles.kBody15SemiboldTextStyle
                              .copyWith(color: AppColors.white),
                        ),
                        Text(
                          "Online",
                          style: AppTextStyles.kBody15RegularTextStyle
                              .copyWith(color: AppColors.white40),
                        ),
                      ],
                    ),
                  ),
                ),
              ):SizedBox(height: size.height*.25,);
            }
          ),
        ));
  }
}
