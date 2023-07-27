import 'package:aagyodeliverypartners/colors/colors_const.dart';
import 'package:aagyodeliverypartners/const/constContainer.dart';
import 'package:aagyodeliverypartners/landing_page/bottom_screen_pages/home/utils/home_utils.dart';
import 'package:aagyodeliverypartners/landing_page/bottom_screen_pages/home/views/action_screens/notifications.dart';
import 'package:aagyodeliverypartners/landing_page/bottom_screen_pages/home/views/action_screens/sos.dart';
import 'package:aagyodeliverypartners/landing_page/bottom_screen_pages/order/views/order_screen.dart';
import 'package:aagyodeliverypartners/landing_page/neworder/views/new_order.dart';
import 'package:aagyodeliverypartners/styles/textstyle_const.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import '../../../../const/constString.dart';
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
  var textValue = '😎';
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
  final _numPages = 5;
  PageController _pageController = PageController();
  double _currentPage = 0;
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      // Show the bottom sheet when the screen is opened
      homeUtils.onlineofflineRemainder(context, () {Navigator.pop(context); }, () {
        toggleSwitch(true);
        Navigator.pop(context);
      });
    });
  }
  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.primary,
          automaticallyImplyLeading: true,
          title: InkWell(
              onTap: () {
                setState(() {
                  toggleSwitch(true);
                });
              },
              child: ConstantContainer(
                  height: 30,
                  width: 90,
                  color:
                      !ispressed ? AppColors.secondary1 : AppColors.sucess100,
                  radiusBorder: 20,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(!ispressed ? "🤨" : "",
                          style: AppTextStyles.kBody20SemiboldTextStyle),
                      Text(
                        !ispressed ? "Offline" : "Online",
                        style: AppTextStyles.kCaption12SemiboldTextStyle
                            .copyWith(color: AppColors.white),
                      ),
                      Text(ispressed ? "😎" : "",
                          style: AppTextStyles.kBody20SemiboldTextStyle),
                    ],
                  ))),
          actions: [
            IconButton(
              onPressed: () {
                Utils.goTo(context, SOS());
              },
              icon: Image.asset(
                alarm,
                height: 20,
                width: 22,
                color: AppColors.secondary1,
              ),
            ),
            SizedBox(
              width: 5,
            ),
            IconButton(
              onPressed: () {
                Utils.goTo(context, NewOrder());
              },
              icon: Icon(
                Icons.help_outline_outlined,
              ),
            ),
            SizedBox(
              width: 5,
            ),
            IconButton(
              onPressed: () {
                Utils.goTo(context, NotificationPage());
              },
              icon: Icon(
                Icons.notifications_rounded,
              ),
            ),
            SizedBox(
              width: 5,
            ),
          ],
        ),
        body: NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (notification) {
            notification.disallowIndicator();
            return true;
          },
          child: SingleChildScrollView(
            child: Stack(
              children: [
                Column(
                  children: [
                    Container(
                      height: size.height * 0.155,
                      width: size.width,
                      decoration: BoxDecoration(
                          color: AppColors.primary1,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(size.height * 0.08),
                              bottomRight:
                                  Radius.circular(size.height * 0.08))),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 2.0),
                              child: Image.asset(
                                currentlocation,
                                height: 25,
                                width: 25,
                                color: AppColors.white,
                              ),
                            ),
                            Expanded(
                              child: Text(
                                "Nanakmatta Udham Singh Nagar,   Uttarakhand",
                                style: AppTextStyles.kCaption12RegularTextStyle
                                    .copyWith(color: AppColors.white),
                              ),
                            ),
                            // Spacer(),
                            InkWell(
                              onTap: () {
                                Utils.openMap("Train near me");
                                // Utils.goTo(context, UpdateLocation());
                              },
                              child: ConstantContainer(
                                height: size.height * .035,
                                width: size.width * .25,
                                color: AppColors.secondary2,
                                radiusBorder: 10,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8.0),
                                      child: Image.asset(
                                        updatelocation,
                                        height: 25,
                                        width: 25,
                                        color: AppColors.white,
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        "Update Location",
                                        style: AppTextStyles
                                            .kCaption12RegularTextStyle
                                            .copyWith(color: AppColors.white),
                                      ),
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
                      height: size.height * .11,
                    ),
                    ConstantContainer(
                      height: size.height * 0.035,
                      width: size.width,
                      color: AppColors.primary1,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 12),
                        child: Text(
                          "Overview",
                          style: AppTextStyles.kCaption12SemiboldTextStyle
                              .copyWith(color: AppColors.white),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        balanceWigets(
                            "Remaining", "Balance", "₹ 20020.88", "Recharge"),
                        balanceWigets(
                            "Today's", "Earning", "₹ 20100.88", "Payout"),
                        balanceWigets(
                            "Cash", "Collected", "₹ 2020.88", "Orders"),
                      ],
                    ),
                    // Divider(
                    //   color: AppColors.white100,
                    // ),
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
                          TextButton(
                            onPressed: () {
                              Utils.goTo(context, OrderScreen());
                            },
                            child: Text(
                              "View All",
                              style: AppTextStyles.kBody15SemiboldTextStyle
                                  .copyWith(color: AppColors.white70),
                            ),
                          ),
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
                  left: size.width * .12,
                  top: size.height * .055,
                  child: ispressed
                      ? ConstantContainer(
                          height: size.height * .2,
                          width: size.width * .78,
                          // color: Colors.red,
                          radiusBorder: 10,
                          child: Column(
                            children: [
                              Expanded(
                                child: NotificationListener<
                                    OverscrollIndicatorNotification>(
                                  onNotification: (notification) {
                                    notification.disallowIndicator();
                                    return true;
                                  },
                                  child: PageView(
                                    controller: _pageController,
                                    clipBehavior: Clip.none,
                                    onPageChanged: (int page) {
                                      setState(() {
                                        _currentPage = page.toDouble();
                                      });
                                    },
                                    children: const [
                                      Padding(
                                        padding:
                                            EdgeInsets.symmetric(horizontal: 5),
                                        child: AcceptRejectOrder(),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 5.0),
                                        child: AcceptRejectOrder(),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 5.0),
                                        child: AcceptRejectOrder(),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 5.0),
                                        child: AcceptRejectOrder(),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 5.0),
                                        child: AcceptRejectOrder(),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: size.height * .005,
                              ),
                              DotsIndicator(
                                dotsCount: _numPages,
                                position: _currentPage,
                                decorator: DotsDecorator(
                                  size: Size.square(6.0),
                                  // activeSize: const Size(10.0, 10.0),
                                  activeShape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  color: Colors.grey, // Inactive dot color
                                  activeColor:
                                      AppColors.primary, // Active dot color
                                ),
                              )
                            ],
                          ))
                      : Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5.0),
                          child: Container(
                            height: size.height * .17,
                            width: size.width * .75,
                            decoration: BoxDecoration(
                                color: AppColors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: AppColors.white60,
                                    blurRadius: 2,
                                    spreadRadius: 1,
                                    offset: Offset(0, 1),
                                  ),
                                ],
                                image: DecorationImage(
                                    image: AssetImage(offline),
                                    fit: BoxFit.fill)),
                          ),
                        ),
                )
              ],
            ),
          ),
        ));
  }

  Widget balanceWigets(heading, heading2, money, subhead) {
    Size size = MediaQuery.of(context).size;
    return ConstantContainer(
      height: size.height * .1,
      width: size.width * .25,
      color: AppColors.white,
      shadowColor: AppColors.white40.withOpacity(0.9),
      blurradius: 1,
      spreadradius: 3,
      offset: Offset(0, 3),
      radiusBorder: 10,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            heading,
            style: AppTextStyles.kCaption12SemiboldTextStyle
                .copyWith(color: AppColors.primary1),
          ),
          Text(
            heading2,
            style: AppTextStyles.kCaption12SemiboldTextStyle
                .copyWith(color: AppColors.primary1),
          ),
          SizedBox(
            height: size.height * .01,
          ),
          Text(
            money,
            style: AppTextStyles.kBody14SemiboldTextStyle
                .copyWith(color: AppColors.white100),
          ),
          SizedBox(
            height: size.height * .005,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                subhead,
                style: AppTextStyles.kSmall10RegularTextStyle
                    .copyWith(color: AppColors.white100),
              ),
              Icon(
                Icons.arrow_forward_ios,
                color: AppColors.white100,
                size: 10,
              )
            ],
          ),
          // SizedBox(
          //   height: 10,
          // ),
        ],
      ),
    );
  }
}
