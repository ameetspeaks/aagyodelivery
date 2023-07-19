import 'package:aagyodeliverypartners/landing_page/bottom_screen_pages/home/views/home_screen.dart';
import 'package:aagyodeliverypartners/landing_page/bottom_screen_pages/order/views/order_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../colors/colors_const.dart';
import '../const/constString.dart';
import 'bottom_screen_pages/earning/views/earning.dart';
import 'bottom_screen_pages/more/more.dart';
import 'bottom_screen_pages/more/profile/view/profile.dart';
import 'bottom_screen_pages/payout/views/payout.dart';

class Bottom_Page extends StatefulWidget {
  const Bottom_Page({Key? key}) : super(key: key);

  @override
  State<Bottom_Page> createState() => _Bottom_PageState();
}

class _Bottom_PageState extends State<Bottom_Page> {
  bool pressed = false;
  int _currentindex = 0;
  final Screen = [
    const HomeScreen(),
    const PayoutScreen(),
    const OrderScreen(),
    const EarningScreen(),
    const Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Text("ss"),
      ),
      body: Screen[_currentindex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentindex,
        fixedColor: AppColors.primary,
        unselectedFontSize: 10,
        unselectedItemColor: AppColors.neutralLightFonts,
        showUnselectedLabels: true,
        enableFeedback: true,
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(home,height: 25,width: 25,),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(rupee,height: 25,width: 25,),
            label: 'Payout',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(applogo,height: 30,width: 30,),
            label: 'Order',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(wallet,height: 25,width: 25,),
            label: 'Earning',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(moreicon,height: 25,width: 25,),
            label: 'More',
          ),
        ],
        onTap: (index) =>
        {
          setState(() {
            _currentindex = index;
            pressed = true;
          })
        },
      ),

    );
  }
}