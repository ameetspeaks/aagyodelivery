import 'package:aagyodeliverypartners/const/constContainer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../colors/colors_const.dart';
import '../../../../styles/textstyle_const.dart';
import '../../../../utils/Utils.dart';

class AcceptRejectOrder extends StatelessWidget {
  const AcceptRejectOrder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ConstantContainer(
      height: size.height * .28,
      width: size.width * .8,
      color: AppColors.white,
      shadowColor: AppColors.white60,
      radiusBorder: 10,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(child: Text("Store Name",style: AppTextStyles.kBody17SemiboldTextStyle.copyWith(color: AppColors.white100),)),
                Spacer(),
                Expanded(child: Text("Order Number",style: AppTextStyles.kBody15RegularTextStyle.copyWith(color: AppColors.white100),)),

              ],
            ),
            Row(
              children: [
                Expanded(child: Text("Store Address",style: AppTextStyles.kBody15RegularTextStyle.copyWith(color: AppColors.white100),)),
                Spacer(),
                Expanded(child: Text("123456",style: AppTextStyles.kBody15SemiboldTextStyle.copyWith(color: AppColors.white100),)),

              ],
            ),
            SizedBox(height: 10,),
            Row(
              children: [
                Expanded(child: ConstantContainer(height: 1,color: AppColors.sucess100,)),
                InkWell(
                  onTap: (){},
                  child: ConstantContainer(
                    height: size.height*.03,
                    width: size.width*.2,
                    color: AppColors.sucess100,
                    radiusBorder: 8,
                    child:Center(child: Text("Accept",style: AppTextStyles.kBody15SemiboldTextStyle.copyWith(color: AppColors.white),))
                  ),
                )
              ],
            ),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Customer Name",style: AppTextStyles.kBody17SemiboldTextStyle.copyWith(color: AppColors.white100)),
                    Text("Customer Address",style: AppTextStyles.kBody15RegularTextStyle.copyWith(color: AppColors.white100),),
                  ],
                ),
                Spacer(),
                InkWell(
                  onTap: (){
                    Utils.DialogBox(context,"Do you really want to Reject?", "",
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(backgroundColor: AppColors.primary1),
                        child: Text('Confirm'),
                        onPressed: () {
                        },
                      ),
                    );
                  },
                  child: ConstantContainer(
                      height: size.height*.03,
                      width: size.width*.2,
                      color: AppColors.secondary2,
                      radiusBorder: 8,
                      child:Center(child: Text("Reject",style: AppTextStyles.kBody15SemiboldTextStyle.copyWith(color: AppColors.white),))
                  ),
                ),
              ],
            ),
            SizedBox(height: 20,),
            Row(
              children: [
                Column(
                  children: [
                    ConstantContainer(height: size.height*.048,width: 2,color: AppColors.white100,),
                  ],
                ),
                SizedBox(width: 5,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("₹180.80",style: AppTextStyles.kBody17SemiboldTextStyle.copyWith(color: AppColors.white100)),
                    Text("COD",style: AppTextStyles.kBody15RegularTextStyle.copyWith(color: AppColors.white100),),
                  ],
                ),
                Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("10 Jul,2023",style: AppTextStyles.kBody15SemiboldTextStyle.copyWith(color: AppColors.white100)),
                    Text("08:55 PM",style: AppTextStyles.kCaption12RegularTextStyle.copyWith(color: AppColors.white100),),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
