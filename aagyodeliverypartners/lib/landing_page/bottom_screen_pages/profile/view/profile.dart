

import 'dart:io';

import 'package:aagyodeliverypartners/landing_page/bottom_screen_pages/profile/view/payout.dart';
import 'package:aagyodeliverypartners/landing_page/bottom_screen_pages/profile/view/profileview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../colors/colors_const.dart';
import '../../../../const/constString.dart';
import '../../../../styles/textstyle_const.dart';
import '../../../auth/views/welcomeScreen.dart';

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
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "The Aagyo Store",
          style: AppTextStyles.kBody17SemiboldTextStyle
              .copyWith(color: AppColors.neutralDark),
        ),
      ),
      body: Column(
        children: [
          Center(
            child:GestureDetector(
              onTap: () {
                _showImagePicker(context);
              },
              child: CircleAvatar(
                radius: 52,
                backgroundColor: AppColors.primary700,
                child: CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.white,
                  backgroundImage: imageFile != null
                      ? FileImage(imageFile!)
                      : AssetImage(splash) as ImageProvider,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          ConstantListTile("Profile Details",profile,() {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfileDetails()));
          },),
          ConstantListTile("Contact Us Details",contact,() {

          },),
          ConstantListTile("Sound Setting",sound,() {
            showDialog(context: context, builder: (context){
              return AlertDialog(
                title: Text('Sound'),
                content: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('On/Off'),
                    Transform.scale(
                      scale: .9,
                      child: CupertinoSwitch(
                        activeColor: Colors.green,
                        value: _toggleValue,
                        onChanged: (bool newValue) {
                          setState(() {
                            _toggleValue = newValue;
                          });
                        },
                      ),
                    ),
                  ],
                ),

              );
            });
          },),
          ConstantListTile("Payout",payout,() {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>WalletPageScreen()));
          },),
          ConstantListTile("Stop Reminder",stop,() {

          },),
          ConstantListTile("Logout",logout,() {
            show(AlertDialog(
              content: Text('Do you really want to logout ?'),
              actions: [
                TextButton(
                  child: Text('Yes'),
                  onPressed: () {
                    Get.offAll(WelcomeScreen());
                  },
                ),
                TextButton(
                  child: Text('No'),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ));

            // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>WelcomeScreen()));
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
    return Column(
      children: [
        InkWell(
          onTap: ontap,
          child: ListTile(
            leading: CircleAvatar(
                backgroundColor: AppColors.neutral20,
                child: Image.asset(
                  leading,
                )),
            title: Text(
              title,
              style: AppTextStyles.kCaption12RegularTextStyle
                  .copyWith(color: AppColors.neutralDark),
            ),
            trailing: Icon(
              Icons.arrow_forward_ios,
              color: AppColors.neutral50,
              size: 20,
            ),
          ),
        ),
        // Padding(
        //   padding: const EdgeInsets.fromLTRB(25, 0, 8, 0),
        //   child: ConstantContainer(height: 0.0008, width: MediaQuery.of(context).size.width*0.9, radiusBorder: 0, borderWidth: 0, widget: Text("data"), borderColor: AppColors.neutralBackground,color: AppColors.neutralBorder,),
        // )

      ],
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



 void show(
     Widget widgets
     ){
   showDialog(
     context: context,
     builder: (BuildContext context) {
       return widgets;
     },
   );
 }



}
