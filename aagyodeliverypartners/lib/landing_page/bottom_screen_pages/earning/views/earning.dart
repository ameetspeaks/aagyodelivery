import 'package:aagyodeliverypartners/const/constContainer.dart';
import 'package:aagyodeliverypartners/landing_page/bottom_screen_pages/earning/views/daywise_earning_page.dart';
import 'package:aagyodeliverypartners/landing_page/bottom_screen_pages/earning/views/recentactivity.dart';
import 'package:aagyodeliverypartners/styles/textstyle_const.dart';
import 'package:aagyodeliverypartners/utils/Utils.dart';
import 'package:flutter/material.dart';
import '../../../../colors/colors_const.dart';

class EarningScreen extends StatelessWidget {
  const EarningScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        centerTitle: true,
        title: Text("Earning",style: AppTextStyles.kBody15SemiboldTextStyle.copyWith(color: AppColors.white),),
      ),
      body: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (notification){
          notification.disallowIndicator();
          return true;
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
            children: [
            Column(
            children: [
            Container(
              height: size.height * 0.42,
              width: size.width,
              decoration: const BoxDecoration(
                color: AppColors.primary1,
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 10, top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Total Balance',
                      style: AppTextStyles.kBody15RegularTextStyle
                          .copyWith(color: AppColors.white),
                    ),
                    Text(
                      '₹500',
                      style: AppTextStyles.kLargeTitleTextStyle
                          .copyWith(color: AppColors.white),
                    )
                  ],
                ),
              ),
            ),
            ],
          ),
          Positioned(
            top: size.height * 0.11,
            left: size.width * 0.05,
            child: const RechargeWallet(),
          )
          ],
        ),
                SizedBox(height: 10,),
                ConstantContainer(
                  height: size.height*.4,
                  color: AppColors.primary1,
                  borderColor: AppColors.white80,
                  radiusBorder: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text("Total Earnings",style: AppTextStyles.kHeading3TextStyle.copyWith(color: AppColors.white),),
                        Text("26 Jun 02 Jul",style: AppTextStyles.kBody15RegularTextStyle.copyWith(color: AppColors.white50),),
                        SizedBox(height: 10,),
                        Text("₹5863",style: AppTextStyles.kHeading1TextStyle.copyWith(color: AppColors.white),),
                        Text("67h 37m on duty",style: AppTextStyles.kBody15RegularTextStyle.copyWith(color: AppColors.white50),),
                        SizedBox(height: 20,),
                        Row(
                          children: [
                            Expanded(child: ConstantContainer(height: 1,color: AppColors.white20,)),
                            Text(" EARNING BREAKUP ",style: AppTextStyles.kBody17RegularTextStyle.copyWith(color: AppColors.white50),),
                            Expanded(child: ConstantContainer(height: 1,color: AppColors.white20,)),
                          ],
                        ),
                        constRow("Order Earning","₹3233"),
                        constRow("Incentives","₹323"),
                        constRow("Customer Tips","₹32"),
                        constRow("Bonus","₹1201"),
                        constRow("Adjustments","₹12"),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8,8,8,0),
                  child: Text("DAYWISE EARNINGS",style: AppTextStyles.kBody17SemiboldTextStyle.copyWith(color: AppColors.white90),),
                ),
                ListView.builder(
                    itemCount: 5,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context,index){
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: (){
                            Utils.goTo(context, DayWiseEarning());
                          },
                          child: ConstantContainer(
                            color: AppColors.primary,
                            radiusBorder: 5,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  SizedBox(height: 20,),
                                  Row(
                                    children: [
                                      Expanded(child: Text("Sat, 01 Jul",style: AppTextStyles.kBody17SemiboldTextStyle.copyWith(color: AppColors.white),)),
                                      Text("₹1281",style: AppTextStyles.kBody17SemiboldTextStyle.copyWith(color: AppColors.white),),
                                      Icon(
                                        Icons.arrow_forward_ios_sharp,
                                        color: AppColors.white,
                                        size: 15,
                                      )
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Icon(
                                        Icons.access_time_rounded,
                                        color: AppColors.white,
                                        size: 15,
                                      ),
                                      Text("12h15m",
                                          style: AppTextStyles.kCaption12RegularTextStyle
                                              .copyWith(color: AppColors.white)),

                                    ],
                                  ),
                                  SizedBox(height: 20,),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
                SizedBox(height: 20,)
              ],
            ),
          ),
        ),
      ),
    );
  }
  Widget constRow(leftText,rightText){
    return  Column(
      children: [
        Row(
          children: [
            Text(leftText,style: AppTextStyles.kBody15SemiboldTextStyle.copyWith(color: AppColors.white),),
            Spacer(),
            Text(rightText,style: AppTextStyles.kBody15RegularTextStyle.copyWith(color: AppColors.white),),

          ],
        ),
        SizedBox(height: 10,),
      ],
    );
  }
}
