import 'package:aagyodeliverypartners/colors/colors_const.dart';
import 'package:aagyodeliverypartners/landing_page/bottom_screen_pages/home/widgets/const_gridview.dart';
import 'package:aagyodeliverypartners/landing_page/bottom_screen_pages/home/widgets/const_switch.dart';
import 'package:aagyodeliverypartners/styles/textstyle_const.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
             elevation: 0,
        backgroundColor: AppColors.white10,
        centerTitle: true,
        title: Text("Aagyo Delivery Partner",style: AppTextStyles.kBody17RegularTextStyle.copyWith(color: AppColors.primary700),),
        actions: [
          SwitchScreen(),
        ],
      ),
      body: Column(
        children: [
          ConstGridView()
        ],
      ),
    );
  }
}
