import 'dart:io';
import 'package:aagyodeliverypartners/const/constContainer.dart';
import 'package:aagyodeliverypartners/landing_page/auth/views/login_screen.dart';
import 'package:aagyodeliverypartners/landing_page/bottom_screen_pages/more/profile/view/aagyo_id.dart';
import 'package:aagyodeliverypartners/landing_page/bottom_screen_pages/more/profile/view/insurance_details.dart';
import 'package:aagyodeliverypartners/landing_page/bottom_screen_pages/more/profile/view/personal_details.dart';
import 'package:aagyodeliverypartners/landing_page/bottom_screen_pages/more/profile/view/account_details.dart';
import 'package:aagyodeliverypartners/landing_page/bottom_screen_pages/more/profile/view/qr.dart';
import 'package:aagyodeliverypartners/utils/Utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../../colors/colors_const.dart';
import '../../../../../const/constString.dart';
import '../../../../../styles/textstyle_const.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  double _userRating =2.5;
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.primary,
        elevation: 0,
        title: Text(
          "Profile Details",
          style: AppTextStyles.kBody17SemiboldTextStyle
              .copyWith(color: AppColors.white10),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    // _showImagePicker(context);
                  },
                  child: const CircleAvatar(
                    radius: 52,
                    backgroundColor: AppColors.primary,
                    child: CircleAvatar(
                      radius: 50,
                      backgroundColor: AppColors.white50,
                      backgroundImage: AssetImage(splash),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 4,
                ),
                Text(
                  "John XYZ\nAagyo ID: 2585",
                  style: AppTextStyles.kBody15SemiboldTextStyle
                      .copyWith(color: AppColors.white100),
                ),
              ],
            ),
          ),
          ConstantContainer(
            height: size.height * 0.08,
            width: size.width * .9,
            borderWidth: 2,
            shadowColor: AppColors.white30,
            borderColor: AppColors.primary1,
            radiusBorder: 5,
            child: Center(
                child:  Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Text("  Your's Rating",style: AppTextStyles.kBody15SemiboldTextStyle,),
                    Expanded(
                      child: RatingBar.builder(
                        initialRating: _userRating,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                        itemBuilder: (context, _) => const Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (rating) {
                          setState(() {
                            _userRating = rating;
                          });
                        },
                      ),
                    ),
                  ],
                ),),
          ),
          const SizedBox(
            height: 50,
          ),
          ConstantListTile(
            "Personal Details",
            people,
            () {
              Utils.goTo(context, const PersonalDetails());
            },
          ),
          ConstantListTile(
            "Insurance Details",
            insurance,
            () {
              Utils.goTo(context, const InsuranceDetails());
            },
          ),
          ConstantListTile(
            "Account Details",
            bankaccount,
            () {
              Utils.goTo(context, const AccountDetails());
            },
          ),
          ConstantListTile(
            "Aagyo ID",
            idcard,
            () {
              Utils.goTo(context, const AagyoId());
            },
          ),
          // ConstantListTile("QR Code for Aagyo ID",qr,() {
          //   Utils.goTo(context, QR());
          // },),
          ConstantListTile(
            "Logout",
            logout,
            () {
              Utils.DialogBox(
                context,
                "Do you really want to Logout?",
                "",
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary1),
                  child: const Text('Confirm'),
                  onPressed: () {
                    Get.offAll(const LoginPage());
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  ConstantListTile(
    final String title,
    final String leading,
    final VoidCallback ontap,
  ) {
    return Column(
      children: [
        InkWell(
          onTap: ontap,
          child: ListTile(
            leading: CircleAvatar(
                backgroundColor: AppColors.neutral20,
                child: Image.asset(
                  leading,
                  height: 20,
                  width: 20,
                )),
            title: Text(
              title,
              style: AppTextStyles.kBody17RegularTextStyle
                  .copyWith(color: AppColors.neutralDark),
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios,
              color: AppColors.neutral50,
              size: 20,
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: ConstantContainer(
            height: .5,
            color: AppColors.white50,
          ),
        )
      ],
    );
  }
}
