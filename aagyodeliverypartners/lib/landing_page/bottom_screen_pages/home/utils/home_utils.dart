import 'package:aagyodeliverypartners/colors/colors_const.dart';
import 'package:aagyodeliverypartners/const/constContainer.dart';
import 'package:aagyodeliverypartners/styles/textstyle_const.dart';
import 'package:flutter/material.dart';
import 'package:slider_button/slider_button.dart';

class homeUtils{

  static void onlineofflineRemainder(BuildContext context,VoidCallback onTapOffline,VoidCallback OnTapOnline) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                      'Offline Mode',
                      style: AppTextStyles.kBody17SemiboldTextStyle.copyWith(color: AppColors.white100)
                  ),
                  IconButton(
                    icon: Icon(Icons.close),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
              Divider(color: AppColors.white40,thickness: 1,),
              SizedBox(height: 10.0),
              Text(
                  'You have logged in offline mode and will not receive any orders.',
                  style:AppTextStyles.kBody15SemiboldTextStyle
              ),
              SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: onTapOffline,
                    child: ConstantContainer(
                      width: MediaQuery.of(context).size.width/2.3,
                      borderColor: AppColors.secondary1,
                      radiusBorder: 5,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 8),
                        child: Center(child: Text("Stay Offline",style: AppTextStyles.kBody17RegularTextStyle.copyWith(color: AppColors.secondary1),)),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: OnTapOnline,
                    child: ConstantContainer(
                      width: MediaQuery.of(context).size.width/2.3,
                      color: AppColors.primary,
                      radiusBorder: 5,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 8),
                        child: Center(child: Text("Go Online",style: AppTextStyles.kBody17RegularTextStyle.copyWith(color: AppColors.white),)),
                      ),
                    ),
                  ),

                ],
              ),
            ],
          ),
        );
      },
    );
  }



}