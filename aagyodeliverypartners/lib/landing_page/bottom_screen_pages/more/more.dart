import 'package:aagyodeliverypartners/landing_page/bottom_screen_pages/more/profile/view/profile.dart';
import 'package:aagyodeliverypartners/utils/Utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../colors/colors_const.dart';
import '../../../styles/textstyle_const.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        centerTitle: true,
        title: Text("More Options",style: AppTextStyles.kBody15SemiboldTextStyle.copyWith(color: AppColors.white),),
      ),
      body: Column(
        children: [
          ConstantListTile(CupertinoIcons.person, "Profile", () {
            Utils.goTo(context, Profile());
          }),
          ConstantListTile(CupertinoIcons.money_dollar, "Earnings", () {
            // Utils.goTo(context, PayoutScreen());
          }),
          ConstantListTile(Icons.money, "Way to Earn", () {}),
          ConstantListTile(Icons.message, "Message Center", () {}),
          ConstantListTile(Icons.people_alt_outlined, "Refer a Friend", () {}),
          ConstantListTile(Icons.report, "Wrong Action Report", () {}),
        ],
      ),
    );
  }

  ConstantListTile(final IconData leading,
      final String title,
      final VoidCallback ontap,) {
    return InkWell(
      onTap: ontap,
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: AppColors.neutral20,
          child: Icon(
            leading,
            size: 25,
          ),
        ),
        title: Text(
          title,
          style: AppTextStyles.kBody17RegularTextStyle
              .copyWith(color: AppColors.neutralDark),
        ),
        trailing: Icon(
          Icons.arrow_forward_ios,
          color: AppColors.neutral50,
          size: 20,
        ),
      ),
    );
  }
}