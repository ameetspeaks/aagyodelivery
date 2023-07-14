import 'dart:io';

import 'package:aagyodeliverypartners/const/constContainer.dart';
import 'package:aagyodeliverypartners/landing_page/bottom_screen_pages/more/profile/view/payout.dart';
import 'package:aagyodeliverypartners/landing_page/bottom_screen_pages/more/profile/view/personal_details.dart';
import 'package:aagyodeliverypartners/utils/Utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../../colors/colors_const.dart';
import '../../../../../const/constString.dart';
import '../../../../../styles/textstyle_const.dart';
import '../../../../auth/views/welcomeScreen.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool _toggleValue = false;
  File? imageFile;
  Future<void> _selectImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);

    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.primary,
        elevation: 0,
        title: Text(
          "The Aagyo Store",
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
                    _showImagePicker(context);
                  },
                  child: CircleAvatar(
                    radius: 52,
                    backgroundColor: AppColors.primary,
                    child: CircleAvatar(
                      radius: 50,
                      backgroundColor: AppColors.white50,
                      backgroundImage: imageFile != null
                          ? FileImage(imageFile!)
                          : AssetImage(splash) as ImageProvider,
                    ),
                  ),
                ),
                SizedBox(width: 4,),
                Text(
                  "John XYZ\nAagyo ID: 2585",
                  style: AppTextStyles.kBody15SemiboldTextStyle
                      .copyWith(color: AppColors.white100),
                ),
              ],
            ),
          ),
          ConstantContainer(
            height: size.height*0.08,
            width: size.width*.8,
            borderWidth: 2,
            shadowColor: AppColors.white30,
            borderColor: AppColors.primary1,
            radiusBorder: 5,
            child: Center(child: Text("Your Ratings ⭐⭐⭐⭐",style: AppTextStyles.kBody17SemiboldTextStyle.copyWith(color: AppColors.white100),)),
          ),
          SizedBox(
            height: 50,
          ),
          ConstantListTile("Personal Details",people,() {
            Utils.goTo(context, PersonalDetails());
          },),
          ConstantListTile("Insurance Details",insurance,() {},),

          ConstantListTile("Personal Savings Account",bankaccount,() {},),
          ConstantListTile("Aagyo ID and Permit Document",idcard,() {},),
          ConstantListTile("Payout",payout,() {
            Utils.goTo(context, WalletPageScreen());},),
          ConstantListTile("Stop Reminder",stop,() {},),
          ConstantListTile("QR Code for Aagyo ID",qr,() {},),
          ConstantListTile("Logout",logout,() {
            Utils.DialogBox(context,"Do you really want to Logout?", "",
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: AppColors.primary1),
              child: Text('Confirm'),
              onPressed: () {
                Get.offAll(WelcomeScreen());
              },
            ),
            );
          },),
        ],
      ),
    );
  }

  ConstantListTile(
    final String title,
    final String leading,
    final VoidCallback ontap,
  ) {
    return InkWell(
      onTap: ontap,
      child: ListTile(
        leading: CircleAvatar(
            backgroundColor: AppColors.neutral20,
            child: Image.asset(
              leading,height: 20,width: 20,
            )),
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

  void _showImagePicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          child: Wrap(
            children: [
              ListTile(
                leading: Icon(Icons.photo_library),
                title: Text('Choose from Gallery'),
                onTap: () {
                  _selectImage(ImageSource.gallery);
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: Icon(Icons.photo_camera),
                title: Text('Take a Photo'),
                onTap: () {
                  _selectImage(ImageSource.camera);
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }

}
