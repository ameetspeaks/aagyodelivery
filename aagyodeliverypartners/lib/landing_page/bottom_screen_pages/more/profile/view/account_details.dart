import 'package:aagyodeliverypartners/const/constContainer.dart';
import 'package:flutter/material.dart';
  import '../../../../../colors/colors_const.dart';
import '../../../../../const/constString.dart';
import '../../../../../styles/textstyle_const.dart';

class AccountDetails extends StatefulWidget {
  const AccountDetails({Key? key}) : super(key: key);

  @override
  State<AccountDetails> createState() => _AccountDetailsState();
}

class _AccountDetailsState extends State<AccountDetails> {
  @override

  Widget build(BuildContext context) {
Size size =MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.white40,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.primary,
        title: Text("Account Details",style: AppTextStyles.kBody15SemiboldTextStyle.copyWith(color: AppColors.white),),
        centerTitle: true,
      ),
      body:  Container(
        decoration: BoxDecoration(
            // image: DecorationImage(image: AssetImage(background),fit: BoxFit.cover)
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "BANK DETAILS",
                style: AppTextStyles.kBody13SemiboldTextStyle
                    .copyWith(color: AppColors.white80),
              ),
              SizedBox(height: 10,),
              ConstantContainer(
                width: size.width,
                color: AppColors.primary1,
                borderColor: AppColors.white20,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10,),
                      ConstDetails( 'ACCOUNT HOLDER NAME',  'Amit Pandey',),
                      ConstDetails( 'ACCOUNT NUMBER',  '000000000',),
                      ConstDetails( 'BANK NAME',  'CENTRAL BANK OF INDIA',),
                      ConstDetails( 'BANK IFSC',  'SBIN0012910',),
                      ConstDetails( 'EMAIL',  'abc@gmail.com',),
                      ConstDetails( 'AADHAR NUMBER',  '123456789',),
                      ConstDetails( 'Address ',  'Lucknow',),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  Widget ConstDetails(label,name){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppTextStyles.kBody13SemiboldTextStyle
              .copyWith(color: AppColors.white20),
        ),
        Text(
          name,
          style: AppTextStyles.kBody15SemiboldTextStyle
              .copyWith(color: AppColors.white40),
        ),
        SizedBox(height: 10,)
      ],
    );
  }
}
class CustomTextField extends StatelessWidget {
  final String label;
  final String name ;
  CustomTextField({Key? key, required this.label, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppTextStyles.kBody13SemiboldTextStyle
              .copyWith(color: AppColors.white60),
        ),
        Text(
          name,
          style: AppTextStyles.kBody15SemiboldTextStyle
              .copyWith(color: AppColors.white100),
        ),
      ],
    );
  }
}