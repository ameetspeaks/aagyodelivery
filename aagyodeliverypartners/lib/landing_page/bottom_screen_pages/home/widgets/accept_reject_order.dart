import 'package:aagyodeliverypartners/const/constContainer.dart';
import 'package:flutter/material.dart';
import '../../../../colors/colors_const.dart';
import '../../../../styles/textstyle_const.dart';
import '../../../../utils/Utils.dart';

class AcceptRejectOrder extends StatelessWidget {
  const AcceptRejectOrder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ConstantContainer(
      height: size.height * .2,
      width: size.width * .9,
      color: AppColors.white,
      shadowColor: AppColors.white50,
      offset: Offset(3,3),
      blurradius: 1,
      radiusBorder: 10,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Store Name",style: AppTextStyles.kBody15SemiboldTextStyle.copyWith(color: AppColors.white100),),
                    Text("Store Address",style: AppTextStyles.kSmall10RegularTextStyle.copyWith(color: AppColors.white60),),
                  ],
                ),
                Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Order Number",style: AppTextStyles.kCaption12SemiboldTextStyle.copyWith(color: AppColors.white100),),
                    Text("123456",style: AppTextStyles.kCaption12SemiboldTextStyle.copyWith(color: AppColors.white100),),
                  ],
                ),
              ],
            ),
            SizedBox(height: size.height*.005,),
            Row(
              children: [
                Expanded(child: ConstantContainer(height: 1,color: AppColors.sucess100,)),
                InkWell(
                  onTap: (){},
                  child: ConstantContainer(
                    height: size.height*.022,
                    width: size.width*.18,
                    color: AppColors.sucess100,
                    radiusBorder: 6,
                    child:Center(child: Text("Accept",style: AppTextStyles.kBody13SemiboldTextStyle.copyWith(color: AppColors.white),))
                  ),
                )
              ],
            ),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Customer Name",style: AppTextStyles.kBody15SemiboldTextStyle.copyWith(color: AppColors.white100)),
                    Text("Customer Address",style: AppTextStyles.kSmall10RegularTextStyle.copyWith(color: AppColors.white60),),
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
                      height: size.height*.022,
                      width: size.width*.18,
                      color: AppColors.secondary2,
                      radiusBorder: 6,
                      child:Center(child: Text("Reject",style: AppTextStyles.kBody13SemiboldTextStyle.copyWith(color: AppColors.white),))
                  ),
                ),
              ],
            ),
            SizedBox(height: size.height*0.008,),
            Row(
              children: [
                Column(
                  children: [
                    ConstantContainer(height: size.height*.038,width: 1.5,color: AppColors.white100,),
                  ],
                ),
                SizedBox(width: 5,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("₹180.80",style: AppTextStyles.kBody17SemiboldTextStyle.copyWith(color: AppColors.white100)),
                    Text("COD",style: AppTextStyles.kBody13RegularTextStyle.copyWith(color: AppColors.white100),),
                  ],
                ),
                Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("10 Jul,2023",style: AppTextStyles.kBody13SemiboldTextStyle.copyWith(color: AppColors.white100)),
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
