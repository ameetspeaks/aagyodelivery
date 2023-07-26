import 'package:aagyodeliverypartners/landing_page/neworder/views/picked_order.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../colors/colors_const.dart';
import '../../../const/constContainer.dart';
import '../../../styles/textstyle_const.dart';
import '../widgets/const_details_container.dart';
import '../widgets/slide_button_constant.dart';

class ReachedLocation extends StatefulWidget {
  const ReachedLocation({Key? key}) : super(key: key);

  @override
  State<ReachedLocation> createState() => _ReachedLocationState();
}

class _ReachedLocationState extends State<ReachedLocation> {
  @override

  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        centerTitle: true,
        title: Text(
          'Ready to PickUp ',
        ),
      ),

      body: SafeArea(child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(height: 20,),
            ConstantContainer(
              color: AppColors.white50,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(CupertinoIcons.time,color: AppColors.primary),
                    Text(
                      "Pick Order Now",
                      style: AppTextStyles.kBody15SemiboldTextStyle
                          .copyWith(color: AppColors.primary),
                    ),
                  ],
                ),
              )
            ),
            SizedBox(height: 10,),
            Text(
              "Order ID",
              style: AppTextStyles.kBody20RegularTextStyle
                  .copyWith(color: AppColors.white80),
            ),
            SizedBox(height: 5,),
            Text(
              "428542672555452",
              style: AppTextStyles.kHeading2TextStyle
                  .copyWith(color: AppColors.white80),
            ),
            SizedBox(height: 25,),
            ConstDetailContainer(),
            SliderButtonConst(text: 'Ready to Picked',widget:PickedOrder(),)
          ],
        ),
      )),
    );
  }
}
