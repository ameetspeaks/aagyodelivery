import 'package:aagyodeliverypartners/colors/colors_const.dart';
import 'package:aagyodeliverypartners/const/constContainer.dart';
import 'package:aagyodeliverypartners/landing_page/auth/widgets/const_button.dart';
import 'package:aagyodeliverypartners/landing_page/bottomnavbar.dart';
import 'package:aagyodeliverypartners/styles/textstyle_const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DeliveredMessage extends StatelessWidget {
  const DeliveredMessage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(height: 150,),
            CircleAvatar(
              radius: 100,
                backgroundColor: AppColors.primary1,
                child: Text("😊",style: TextStyle(fontSize: 80),)),
            SizedBox(height: 30,),
            Text("Great job! You did perfect trip",style: AppTextStyles.kBody17SemiboldTextStyle.copyWith(color: AppColors.primary),
            ),
            Text("👍",style: AppTextStyles.kBody17RegularTextStyle.copyWith(color: AppColors.primary),
            ),
            SizedBox(height: 60,),
            ConstantContainer(
              height: size.height * 0.09,
              width: size.width,
              radiusBorder: 8,
              borderColor: AppColors.white80,
              borderWidth: .5,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Column(
                  children: [
                    Center(
                      child: RichText(
                        text: TextSpan(
                          text: 'Trip Earning ',
                          style: AppTextStyles.kBody17RegularTextStyle.copyWith(color: AppColors.white100),
                          children: [
                            TextSpan(
                              text: ' ₹ 41.14',
                              style:AppTextStyles.kBody17SemiboldTextStyle.copyWith(color: AppColors.white100),
                            ),
                          ],
                        ),
                      ),),
                    Divider(color: AppColors.white80,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        RichText(
                          text: TextSpan(
                            text: 'Drop distance: ',
                            style: AppTextStyles.kBody17RegularTextStyle.copyWith(color: AppColors.white100),
                            children: [
                              TextSpan(
                                text: ' 4 Km',
                                style:AppTextStyles.kBody17SemiboldTextStyle.copyWith(color: AppColors.white100),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: .9,
                          height: 22,
                          color: AppColors.white80,
                          margin: EdgeInsets.symmetric(horizontal: 10),
                        ),
                        RichText(
                          text: TextSpan(
                            text: 'Time: ',
                            style: AppTextStyles.kBody17RegularTextStyle.copyWith(color: AppColors.white100),
                            children: [
                              TextSpan(
                                text: '28 mins',
                                style:AppTextStyles.kBody17SemiboldTextStyle.copyWith(color: AppColors.white100),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 40,),
            InkWell(
                onTap: (){
                  Get.offAll(Bottom_Page());
                },
                child: ConstButton(text: "Get Next Order"))
          ],
        ),
      ),
    );
  }
}
