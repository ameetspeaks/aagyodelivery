import 'package:aagyodeliverypartners/const/constContainer.dart';
import 'package:aagyodeliverypartners/utils/Utils.dart';
import 'package:flutter/material.dart';
import '../../../../../colors/colors_const.dart';
import '../../../../../const/constString.dart';
import '../../../../../styles/textstyle_const.dart';

class SOS extends StatelessWidget {
  const SOS({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: AppColors.primary1,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        centerTitle: true,
        title: Text("My Emergency Details",style: AppTextStyles.kBody15SemiboldTextStyle.copyWith(color: AppColors.white),),
      ),
      body:Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Emergency Situation?",style: AppTextStyles.kBody20SemiboldTextStyle.copyWith(color: AppColors.white),),
            SizedBox(height: 30,),
            Text("👉 Please use SOS alert only in the case of genuine emergency",style: AppTextStyles.kBody15RegularTextStyle.copyWith(color: AppColors.white40),),
           SizedBox(height: 10,),
            ConstCallContainer(text: "Call Aagyo Emergency Helpline", img: applogo, ontap: (){
             Utils.callNumber("198");
           }),
           ConstCallContainer(text: " Call Ambulance", img: ambulance, ontap: (){
             Utils.callNumber("109");
           }),
           ConstCallContainer(text: "Call Police", img: policeman, ontap: (){
             Utils.callNumber("102");
           }),
          ],
        ),
      )
    );
  }
}
class ConstCallContainer extends StatelessWidget {
  final String text;
  final String img;
  final VoidCallback ontap;
  const ConstCallContainer({Key? key, required this.text,  required this.ontap, required this.img}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: ConstantContainer(
      height: size.height*0.08,
        width: size.width*.8,
        color: AppColors.white,
        radiusBorder: 5,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children:[
            Image.asset(img,height: 40,width: 50,),
            Expanded(child: Text(text,style: AppTextStyles.kBody17SemiboldTextStyle.copyWith(color: AppColors.white90),)),
            Expanded(
              child: InkWell(
                onTap: ontap,
                child: CircleAvatar(
                    backgroundColor: AppColors.success40,
                    child: Icon(Icons.call,color: AppColors.white,size: 20,)),
              ),
            )
          ],),
      ),
    );
  }
}
