import 'package:aagyodeliverypartners/colors/colors_const.dart';
import 'package:aagyodeliverypartners/const/constContainer.dart';
import 'package:aagyodeliverypartners/landing_page/bottom_screen_pages/home/views/action_screens/help.dart';
import 'package:aagyodeliverypartners/landing_page/bottom_screen_pages/home/views/action_screens/notifications.dart';
import 'package:aagyodeliverypartners/landing_page/bottom_screen_pages/home/views/action_screens/sos.dart';
import 'package:aagyodeliverypartners/landing_page/bottom_screen_pages/home/views/update_location.dart';
import 'package:aagyodeliverypartners/landing_page/bottom_screen_pages/order/views/order_screen.dart';
import 'package:aagyodeliverypartners/styles/textstyle_const.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../const/constString.dart';
import '../../../../const/const_dropdown.dart';
import '../../../../utils/Utils.dart';
import '../widgets/accept_reject_order.dart';
import '../widgets/const_tab_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  bool ispressed = false;
  var textValue = '🤨';

  void toggleSwitch(bool value) {
    if (ispressed == false) {
      setState(() {
        ispressed = true;
        textValue = '😎';
      });
    } else {
      setState(() {
        ispressed = false;
        textValue = '🤨';
      });
    }
  }

  String selectedValue1 = "Today";
  String selectedValue2 = "Choose Date";
  final _numPages = 3;
   PageController _pageController = PageController();
  double _currentPage = 0;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.primary,
          automaticallyImplyLeading: true,
          title:Row(
            children: [
              Text('$textValue', style: AppTextStyles.kHeading1TextStyle),
              InkWell(
                  onTap: () {
                    setState(() {
                      toggleSwitch(true);
                    });
                  },
                  child: ConstantContainer(
                      height: 30,
                      width: 50,
                      color: !ispressed ? AppColors.secondary1 : AppColors.sucess100,
                      borderColor: AppColors.white,
                      radiusBorder: 5,
                      child: Center(
                          child: Text(
                            !ispressed ? "Offline" : "Online",
                            style: AppTextStyles.kCaption12SemiboldTextStyle
                                .copyWith(color: AppColors.white),
                          ))))
            ],
          ),
          actions: [
            IconButton(onPressed: (){
              Utils.goTo(context, SOS());
            }, icon:  Image.asset(
              alarm,
              height: 20,
              width: 22,
              color: AppColors.secondary1,
            ),),
            SizedBox(
              width: 5,
            ),
            IconButton(onPressed: (){
              Utils.goTo(context, Help());
            }, icon: Icon(
              Icons.help_outline_outlined,
            ),),
            SizedBox(
              width: 5,
            ),
            IconButton(onPressed: (){
              Utils.goTo(context, NotificationPage());
            }, icon:Icon(
              Icons.notifications_rounded,
            ),),

            SizedBox(
              width: 5,
            ),
          ],
        ),
        body:  NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (notification){
            notification.disallowIndicator();
            return true;
          },
          child: SingleChildScrollView(
            child: Stack(
              children: [
                Column(
                  children: [
                    Container(
                      height: size.height * 0.28,
                      width: size.width,
                      decoration: BoxDecoration(
                          color: AppColors.primary1,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(400),
                              bottomRight: Radius.circular(400))),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              currentlocation,
                              height: 25,
                              width: 25,
                              color: AppColors.white,
                            ),
                            Text(
                              "Jankipuram Tedhi Puliya,\nLucknow",
                              style: AppTextStyles.kBody15RegularTextStyle
                                  .copyWith(color: AppColors.white),
                            ),
                            Spacer(),
                            InkWell(
                              onTap: (){
                                Utils.goTo(context, UpdateLocation());
                              },
                              child: ConstantContainer(
                                height: size.height * .05,
                                width: size.width * .3,
                                color: AppColors.secondary2,
                                radiusBorder: 10,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Image.asset(
                                      updatelocation,
                                      height: 25,
                                      width: 25,
                                      color: AppColors.white,
                                    ),
                                    Text(
                                      "Update\nLocation",
                                      style: AppTextStyles.kBody15RegularTextStyle
                                          .copyWith(color: AppColors.white),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 100,
                    ),
                    ConstantContainer(
                      height: size.height * 0.05,
                      color: AppColors.primary1,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              "Overview",
                              style: AppTextStyles.kBody15SemiboldTextStyle
                                  .copyWith(color: AppColors.white),
                            ),
                            Spacer(),
                            // ConstantDropdown(
                            //   dropdownColor: AppColors.primary1,
                            //   textColor: AppColors.white,
                            //   iconColor: AppColors.white,
                            //   options: ['Today', 'Yesterday', 'Choose Date'],
                            //   selectedOption: selectedValue1,
                            //   onChanged: (newValue) {
                            //     setState(() {
                            //       selectedValue1 = newValue;
                            //     });
                            //   },
                            // ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        balanceWigets(
                            "Remaining\nBalance", "₹ 2000.88", "Recharge"),
                        balanceWigets("Today's\nEarning", "₹ 2000.88", "Payout"),
                        balanceWigets("Cash\nCollected", "₹ 200.88", "Orders"),
                      ],
                    ),
                    Divider(color: AppColors.white100,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              "Recent Orders",
                              style: AppTextStyles.kBody15SemiboldTextStyle
                                  .copyWith(color: AppColors.white100),
                            ),
                          ),
                          TextButton(onPressed: (){
                            Utils.goTo(context, OrderScreen());
                          }, child:  Text(
                            "View All",
                            style: AppTextStyles.kBody15SemiboldTextStyle
                                .copyWith(color: AppColors.white70),
                          ),),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 15,
                          ),
                        ],
                      ),
                    ),
                    Container(height: size.height, child: ConstTabBar())
                  ],
                ),
                Positioned(
                    left: 40,
                    top: 60,
                    child: ispressed?Stack(
                      children: [
                    ConstantContainer(
                          height: size.height * .28,
                          width: size.width * .8,
                          color: Colors.transparent,
                          radiusBorder: 10,
                          child: Column(
                            children: [
                              Expanded(
                                child: NotificationListener<OverscrollIndicatorNotification>(
                                  onNotification: (notification){
                                    notification.disallowIndicator();
                                    return true;
                                  },
                                  child: PageView(
                                    controller: _pageController,
                                    onPageChanged: (int page) {
                                      setState(() {
                                        _currentPage = page.toDouble();
                                      });
                                    },
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 5),
                                        child: AcceptRejectOrder(),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                                        child: AcceptRejectOrder(),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                                        child: AcceptRejectOrder(),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          )
                        ),
                        Positioned(
                          left: size.width*.32,
                          bottom: 10,
                          child:DotsIndicator(
                          dotsCount: _numPages,
                          position: _currentPage,
                          decorator: DotsDecorator(
                            color: Colors.grey, // Inactive dot color
                            activeColor: AppColors.primary, // Active dot color
                          ),
                        ),)
                      ],
                    ):ConstantContainer(
                        height: size.height * .28,
                        width: size.width * .8,
                        color: AppColors.white,
                        radiusBorder: 10,
                        child: Column(
                          children: [
                            SizedBox(height: 20,),
                            Text("🤨",style:TextStyle(fontSize: 100),),
                            Text("You are Offline",style:AppTextStyles.kBody17SemiboldTextStyle.copyWith(color: AppColors.error100),),
                          ],
                        )),
                )
              ],
            ),
          ),
        ));
  }

  Widget balanceWigets(heading, money, subhead) {
    Size size = MediaQuery.of(context).size;
    return ConstantContainer(
      height: size.height * .15,
      width: size.width * .3,
      color: AppColors.white,
      shadowColor: AppColors.white60,
      radiusBorder: 10,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 5,
          ),
          Text(
            heading,
            style: AppTextStyles.kBody17SemiboldTextStyle
                .copyWith(color: AppColors.primary1),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            money,
            style: AppTextStyles.kBody20SemiboldTextStyle
                .copyWith(color: AppColors.white100),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                subhead,
                style: AppTextStyles.kBody17RegularTextStyle
                    .copyWith(color: AppColors.white70),
              ),
              Icon(
                Icons.arrow_forward_ios,
                color: AppColors.white70,
                size: 15,
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
