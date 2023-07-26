import 'package:aagyodeliverypartners/landing_page/neworder/views/delivered.dart';
import 'package:aagyodeliverypartners/landing_page/neworder/views/reached_pickedup_location.dart';
import 'package:flutter/material.dart';
import '../../../colors/colors_const.dart';
import '../../../const/constContainer.dart';
import '../../../styles/textstyle_const.dart';
import '../../../utils/Utils.dart';
import '../../bottom_screen_pages/home/widgets/const_tab_bar.dart';
import '../widgets/slide_button_constant.dart';

class DropLocation extends StatelessWidget {
  const DropLocation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size  = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.primary,
          centerTitle: true,
          title: Text(
            'Drop Location',
          ),
        ),
        body:SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                SizedBox(height: 100,),
                ConstantContainer(
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
                          "Satyam Singh",
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
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            InkWell(
                              onTap: (){
                                Utils.callNumber("199");
                              },
                              child: ConstantContainer(
                                width: MediaQuery.of(context).size.width/2.3,
                                borderColor: AppColors.primary,
                                radiusBorder: 5,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 8),
                                  child: Center(child: Text("Call",style: AppTextStyles.kBody17RegularTextStyle.copyWith(color: AppColors.white100),)),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: (){
                                Utils.openMap("Biryani near me");
                              },
                              child: ConstantContainer(
                                width: MediaQuery.of(context).size.width/2.3,
                                color: AppColors.primary,
                                radiusBorder: 5,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 8),
                                  child: Center(child: Text("Go to Map",style: AppTextStyles.kBody17RegularTextStyle.copyWith(color: AppColors.white),)),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10,),
                        RichText(
                          text: TextSpan(
                            text: 'Order: ',
                            style: AppTextStyles.kBody15RegularTextStyle.copyWith(color: AppColors.white100),
                            children: [
                              TextSpan(
                                text: '4244555554',
                                style:AppTextStyles.kBody15SemiboldTextStyle.copyWith(color: AppColors.white100),
                              ),
                            ],
                          ),
                        ),
                        RichText(
                          text: TextSpan(
                            text: 'Pickup: ',
                            style: AppTextStyles.kBody15RegularTextStyle.copyWith(color: AppColors.white100),
                            children: [
                              TextSpan(
                                text: 'Om Kali Restaurant',
                                style:AppTextStyles.kBody15SemiboldTextStyle.copyWith(color: AppColors.white100),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                SliderButtonConst(text: 'Reached drop Location',widget:DeliverOrder(),)
              ],
            ),
          ),
        )
    );
  }
}
