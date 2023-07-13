import 'package:aagyodeliverypartners/const/constContainer.dart';
import 'package:aagyodeliverypartners/utils/Utils.dart';
import 'package:flutter/material.dart';
import '../../../../../colors/colors_const.dart';
import '../../../../../styles/textstyle_const.dart';

class SOS extends StatelessWidget {
  const SOS({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        centerTitle: true,
        title: Text("My Emergency Details",style: AppTextStyles.kBody15SemiboldTextStyle.copyWith(color: AppColors.white),),
      ),
      body:Column(
        children: [
          ConstantContainer(
            width: size.width,
            color: AppColors.primary1,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text("Emergency Situation?",style: AppTextStyles.kBody20SemiboldTextStyle.copyWith(color: AppColors.white),),
                  SizedBox(height: 30,),
                  Text("👉 Please use SOS alert only in the case of genuine emergency",style: AppTextStyles.kBody15RegularTextStyle.copyWith(color: AppColors.white40),),
                 SizedBox(height: 10,),
                  ConstCallContainer(text: "Call AAgyo Emergency Helpline", icon: Icons.phone, ontap: (){
                   Utils.callNumber("198");
                 }),
                 ConstCallContainer(text: "Call Ambulance", icon: Icons.medical_services_outlined, ontap: (){
                   Utils.callNumber("109");
                 }),
                 ConstCallContainer(text: "Call Police", icon: Icons.local_police_outlined, ontap: (){
                   Utils.callNumber("102");
                 }),
                ],
              ),
            ),
          ),
        ],
      )
    );
  }
}
class ConstCallContainer extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback ontap;
  const ConstCallContainer({Key? key, required this.text, required this.icon, required this.ontap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: ontap,
        child: ConstantContainer(
        height: size.height*0.08,
          width: size.width*.8,
          color: AppColors.white,
          radiusBorder: 5,
          child: Row(
            children:[
              Expanded(child: Icon(icon,size: 35,)),
              Expanded(child: Text(text,style: AppTextStyles.kBody17SemiboldTextStyle.copyWith(color: AppColors.white90),)),

            ],),
        ),
      ),
    );
  }
}
