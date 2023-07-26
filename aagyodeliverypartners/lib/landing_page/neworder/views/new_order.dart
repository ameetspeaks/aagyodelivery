import 'package:aagyodeliverypartners/colors/colors_const.dart';
import 'package:aagyodeliverypartners/const/constContainer.dart';
import 'package:aagyodeliverypartners/landing_page/neworder/views/slide_to_accept.dart';
import 'package:aagyodeliverypartners/landing_page/neworder/widgets/slide_button_constant.dart';
import 'package:aagyodeliverypartners/styles/textstyle_const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../widgets/circular_timer.dart';

class NewOrder extends StatelessWidget {
  const NewOrder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        centerTitle: true,
        title: Text(
          'New Order',
        ),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            Center(child: CircularTimer()),
            SizedBox(
              height: 10,
            ),
            Text(
              "New Order !",
              style: AppTextStyles.kHeading3TextStyle
                  .copyWith(color: AppColors.white100),
            ),
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
                            text: 'Expected Earning ',
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
                            text: 'Pickup ',
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
                            text: 'Drop ',
                            style: AppTextStyles.kBody17RegularTextStyle.copyWith(color: AppColors.white100),
                            children: [
                              TextSpan(
                                text: ' 4 Km',
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
            SizedBox(height: 10,),
            ConstantContainer(
              height: size.height * 0.164,
              width: size.width,
              radiusBorder: 8,
              borderColor: AppColors.white80,
              borderWidth: .5,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 6.0,horizontal: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Text(
                     "Pickup From",
                     style: AppTextStyles.kBody15RegularTextStyle
                         .copyWith(color: AppColors.white70),
                   ),
                   SizedBox(height: 10,),
                   Text(
                     "Om Kali Restaurant",
                     style: AppTextStyles.kBody20SemiboldTextStyle
                         .copyWith(color: AppColors.white100),
                   ),
                   SizedBox(height: 5,),
                   Text(
                     "Pipri Road,Jankipuram Sector-H Tedhi Puliya  Lucknow  ",
                     style: AppTextStyles.kBody15RegularTextStyle
                         .copyWith(color: AppColors.white70),
                   ),
                   SizedBox(height: 5,),
                   Row(
                     children: [
                       Icon(CupertinoIcons.time,color: AppColors.white60),
                       Text(
                         "2 mins away",
                         style: AppTextStyles.kBody15RegularTextStyle
                             .copyWith(color: AppColors.white60),
                       ),
                     ],
                   )
                 ],
                ),
              ),
            ),
         SizedBox(height: 55,),
             SliderButtonConst(text: 'Slide to Accept',widget:SlideToAccept(),)
          ],
        ),
      )),
    );
  }
}
