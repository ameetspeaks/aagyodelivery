import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../colors/colors_const.dart';
import '../const/constString.dart';
import 'bottom_screen_pages/profile/view/profile.dart';

class Bottom_Page extends StatefulWidget {
  const Bottom_Page({Key? key}) : super(key: key);

  @override
  State<Bottom_Page> createState() => _Bottom_PageState();
}

class _Bottom_PageState extends State<Bottom_Page> {
  int _currentindex = 0;
  final Screen = [
    Center(child: Text("Home")),
    Center(child: Text("Order")),
    Center(child: Text("Add")),
    Center(child: Text("Menu")),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Screen[_currentindex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentindex,
        // type: BottomNavigationBarType.shifting,
        fixedColor: AppColors.primary700,
        unselectedItemColor: AppColors.neutralLightFonts,
        showUnselectedLabels: true,
        enableFeedback: false,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.unfold_more, size: 20,),
            label: 'Order',
            // backgroundColor:ConstantColor.bottomnav
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_box_outlined),
            label: 'Add',
            // backgroundColor:ConstantColor.bottomnav
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book_outlined),
            label: 'Menu',
            // backgroundColor:ConstantColor.bottomnav
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.profile_circled),
            label: 'Profile',
            // backgroundColor:ConstantColor.bottomnav
          ),
        ],
        onTap: (index) =>
        {
          setState(() {
            _currentindex = index;
          })
        },
      ),

    );
  }
}