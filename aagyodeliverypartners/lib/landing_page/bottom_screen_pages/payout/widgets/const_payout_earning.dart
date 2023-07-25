import 'package:aagyodeliverypartners/colors/colors_const.dart';
import 'package:aagyodeliverypartners/landing_page/bottom_screen_pages/payout/views/payout_history.dart';
import 'package:aagyodeliverypartners/landing_page/bottom_screen_pages/payout/views/daywise_earning_page.dart';
import 'package:aagyodeliverypartners/utils/Utils.dart';
import 'package:flutter/material.dart';
import '../../../../const/constContainer.dart';
import '../../../../styles/textstyle_const.dart';

class ConstpayoutEarningScreen extends StatefulWidget {
  const ConstpayoutEarningScreen({Key? key}) : super(key: key);

  @override
  State<ConstpayoutEarningScreen> createState() =>
      _ConstpayoutEarningScreenState();
}

class _ConstpayoutEarningScreenState extends State<ConstpayoutEarningScreen>
    with TickerProviderStateMixin {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    TabController tabController = TabController(length: 2, vsync: this);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        centerTitle: true,
        title: Text("Payout"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TabBar(
              indicatorSize: TabBarIndicatorSize.label,
              indicator: BoxDecoration(
                  color: AppColors.primary1,
                  borderRadius: BorderRadius.circular(10)),
              // isScrollable: true,
              unselectedLabelColor: AppColors.white100,
              unselectedLabelStyle: AppTextStyles.kBody15SemiboldTextStyle,
              controller: tabController,
              tabs: [
                ConstantContainer(
                  width: size.width / 2,
                  borderWidth: 1,
                  borderColor: AppColors.primary1,
                  radiusBorder: 10,
                  child: Center(
                    child: Tab(
                      child: Text(
                        "Earning",
                      ),
                    ),
                  ),
                ),
                ConstantContainer(
                  width: size.width / 2,
                  borderWidth: 1,
                  borderColor: AppColors.primary1,
                  radiusBorder: 10,
                  child: Center(
                    child: Tab(
                      child: Text(
                        "Payout",
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: TabBarView(
                physics: NeverScrollableScrollPhysics(),
                controller: tabController,
                children: [
                  Earning(),
                  PayoutScreen(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Earning extends StatelessWidget {
  const Earning({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return NotificationListener<OverscrollIndicatorNotification>(
      onNotification: (notification) {
        notification.disallowIndicator();
        return true;
      },
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ConstantContainer(
                height: size.height * .4,
                color: AppColors.primary,
                radiusBorder: 5,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      ConstantContainer(
                          color: AppColors.white,
                          radiusBorder: 8,
                          child:Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8.0, vertical: 5),
                            child: Text(
                              "Total Earnings",
                              style: AppTextStyles.kHeading3TextStyle
                                  .copyWith(color: AppColors.primary,),),
                            ),
                          ),
                      Text(
                        "26 Jun 02 Jul",
                        style: AppTextStyles.kBody15RegularTextStyle
                            .copyWith(color: AppColors.white50),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "₹ 5863",
                        style: AppTextStyles.kLargeTitleTextStyle
                            .copyWith(color: AppColors.white),
                      ),
                      Text(
                        "67h 37m on duty",
                        style: AppTextStyles.kBody15RegularTextStyle
                            .copyWith(color: AppColors.white50),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Expanded(
                              child: ConstantContainer(
                            height: 1,
                            color: AppColors.white20,
                          )),
                          Text(
                            " EARNING BREAKUP ",
                            style: AppTextStyles.kBody17RegularTextStyle
                                .copyWith(color: AppColors.white50),
                          ),
                          Expanded(
                              child: ConstantContainer(
                            height: 1,
                            color: AppColors.white20,
                          )),
                        ],
                      ),
                      constRow("Order Earning", "₹3233"),
                      constRow("Incentives", "₹323"),
                      constRow("Customer Tips", "₹32"),
                      constRow("Bonus", "₹1201"),
                      constRow("Adjustments", "₹12"),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "DAYWISE EARNINGS",
                style: AppTextStyles.kBody17SemiboldTextStyle
                    .copyWith(color: AppColors.white90),
              ),
              ListView.builder(
                  itemCount: 5,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                      child: InkWell(
                        onTap: () {
                          Utils.goTo(context, DayWiseEarning());
                        },
                        child: ConstantContainer(
                          color: AppColors.primary1,
                          radiusBorder: 5,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                        child: Text(
                                      "Sat, 01 Jul",
                                      style: AppTextStyles
                                          .kBody17SemiboldTextStyle
                                          .copyWith(color: AppColors.white30),
                                    )),
                                    Text(
                                      "₹1281",
                                      style: AppTextStyles
                                          .kBody17SemiboldTextStyle
                                          .copyWith(color: AppColors.white30),
                                    ),
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
                                        style: AppTextStyles
                                            .kCaption12RegularTextStyle
                                            .copyWith(color: AppColors.white)),
                                  ],
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
              SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget constRow(leftText, rightText) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              leftText,
              style: AppTextStyles.kBody15SemiboldTextStyle
                  .copyWith(color: AppColors.white40),
            ),
            Spacer(),
            Text(
              rightText,
              style: AppTextStyles.kBody15RegularTextStyle
                  .copyWith(color: AppColors.white30),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }
}

class PayoutScreen extends StatelessWidget {
  const PayoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NotificationListener<OverscrollIndicatorNotification>(
      onNotification: (notification) {
        notification.disallowIndicator();
        return true;
      },
      child: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: ConstPayoutContainer(
                ontap1: () {
                  // Utils.goTo(context, WeekEarning());
                },
                ontap2: () {
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
          }),
    );
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
      required this.subTextColor,
      required this.subText,
      required this.ontap1,
      required this.ontap2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ConstantContainer(
      // height: size.height*.162,
      width: size.width,
      color: color1,
      radiusBorder: 10,
      child: Column(
        children: [
          InkWell(
            onTap: ontap1,
            child: ConstantContainer(
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
                              .copyWith(color: AppColors.white40),
                        ),
                        Spacer(),
                        Text(price,
                            style: AppTextStyles.kBody20SemiboldTextStyle
                                .copyWith(color: AppColors.white40)),
                        Icon(
                          Icons.arrow_forward_ios_sharp,
                          color: AppColors.white,
                          size: 15,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
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
            child: Container(
              width: size.width,
              decoration: BoxDecoration(
                  color: color2,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                      bottomRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10))),
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
          ),
        ],
      ),
    );
  }
}
