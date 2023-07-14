import 'package:aagyodeliverypartners/const/constContainer.dart';
import 'package:aagyodeliverypartners/landing_page/bottom_screen_pages/payout/views/payout_history.dart';
import 'package:aagyodeliverypartners/landing_page/bottom_screen_pages/payout/views/week_earning.dart';
import 'package:aagyodeliverypartners/styles/textstyle_const.dart';
import 'package:aagyodeliverypartners/utils/Utils.dart';
import 'package:flutter/material.dart';
import '../../../../colors/colors_const.dart';

class PayoutScreen extends StatelessWidget {
  const PayoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.primary,
          centerTitle: true,
          title: Text("Payout"),
        ),
        body:  NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (notification){
            notification.disallowIndicator();
            return true;
          },
          child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                if (index == 0) {
                 return Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: ConstPayoutContainer(
                     ontap1: (){
                       Utils.goTo(context, WeekEarning());
                     },
                     ontap2: (){
                       Utils.goTo(context, PayoutHistory());
                     },
                      color1: AppColors.white60,
                      color2: AppColors.white30,
                      date: "22 Jun-02 Jul",
                      price: "₹4582",
                      time: "67h37m",
                      color3: AppColors.secondary1,
                      contText: "  New  ",
                      subText: "This week's earning",
                      subTextColor: AppColors.white,
                    ),
                 );
                } else {
                return  Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ConstPayoutContainer(
                    ontap1: (){
                      Utils.goTo(context, WeekEarning());
                    },
                    ontap2: (){
                      Utils.goTo(context, PayoutHistory());
                    },
                      color1: AppColors.primary,
                      color2: AppColors.white40,
                      date: "12 Jun-20 Jun",
                      price: "₹3582",
                      time: "27h37m",
                      color3: AppColors.white20,
                      contText: "",
                      subText: "Last week earning",
                      subTextColor: AppColors.white50,
                    ),
                );
                }
              }),
        ));
  }
}

class ConstPayoutContainer extends StatelessWidget {
  final Color color1;
  final Color color2;
  final Color color3;
  final Color subTextColor;
  final String date;
  final String price;
  final String time;
  final String contText;
  final String subText;
  final VoidCallback ontap1;
  final VoidCallback ontap2;
  const ConstPayoutContainer(
      {Key? key,
      required this.color1,
      required this.color2,
      required this.date,
      required this.price,
      required this.time,
      required this.contText,
      required this.color3,
      required this.subTextColor, required this.subText, required this.ontap1, required this.ontap2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: ontap1,
          child: ConstantContainer(
            color: color1,
            borderColor: AppColors.white80,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text(
                        date,
                        style: AppTextStyles.kBody20SemiboldTextStyle
                            .copyWith(color: AppColors.white),
                      ),
                      Spacer(),
                      Text(price,
                          style: AppTextStyles.kBody20SemiboldTextStyle
                              .copyWith(color: AppColors.white)),
                      Icon(
                        Icons.arrow_forward_ios_sharp,
                        color: AppColors.white,
                        size: 15,
                      )
                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      Text(
                        subText,
                        style: AppTextStyles.kCaption12RegularTextStyle
                            .copyWith(color: subTextColor),
                      ),
                      Spacer(),
                      Icon(
                        Icons.access_time_rounded,
                        color: AppColors.white,
                        size: 15,
                      ),
                      Text(time,
                          style: AppTextStyles.kCaption12RegularTextStyle
                              .copyWith(color: AppColors.white)),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
        ),
        InkWell(
          onTap: ontap2,
          child: ConstantContainer(
            color: color2,
            borderColor: AppColors.white80,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text(
                        "Payout History",
                        style: AppTextStyles.kBody15RegularTextStyle
                            .copyWith(color: AppColors.white100),
                      ),
                      SizedBox(
                        width: 3,
                      ),
                      ConstantContainer(
                        color: color3,
                        radiusBorder: 2,
                        child: Center(
                            child: Text(
                          contText,
                          style: AppTextStyles.kCaption12RegularTextStyle
                              .copyWith(color: AppColors.white),
                        )),
                      ),
                      Spacer(),
                      Icon(
                        Icons.arrow_forward_ios_sharp,
                        color: AppColors.white100,
                        size: 15,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
