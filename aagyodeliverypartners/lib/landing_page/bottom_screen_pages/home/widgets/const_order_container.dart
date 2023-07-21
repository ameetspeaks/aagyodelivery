import 'package:aagyodeliverypartners/landing_page/auth/views/login_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../colors/colors_const.dart';
import '../../../../const/constContainer.dart';
import '../../../../const/constString.dart';
import '../../../../styles/textstyle_const.dart';
import '../../../../utils/Utils.dart';

class ConstOrderContainer extends StatelessWidget {
  final VoidCallback ontapCalltoStore;
  final VoidCallback ontapCalltoCustomer;
  final String text;
  final String messagealert;
  final Color color;
  final Color textColor;
  const ConstOrderContainer({Key? key, required this.text, required this.color, required this.textColor, required this.messagealert, required this.ontapCalltoStore, required this.ontapCalltoCustomer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ConstantContainer(
        color: AppColors.white,
        shadowColor: AppColors.white50,
        offset: Offset(0,3),
        spreadradius: 2,
        blurradius: 3,
        radiusBorder: 15,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    "Order No.13455",
                    style: AppTextStyles.kBody15SemiboldTextStyle
                        .copyWith(color: AppColors.white100),
                  ),
                  Spacer(),
                  Icon(
                    CupertinoIcons.calendar_today,
                  ),
                  Text(
                    "10 Jul 2023",
                    style: AppTextStyles.kSmall10RegularTextStyle
                        .copyWith(color: AppColors.white100),
                  ),
                  Icon(
                    CupertinoIcons.time,
                  ),
                  Text(
                    "08:55PM",
                    style: AppTextStyles.kSmall10RegularTextStyle
                        .copyWith(color: AppColors.white100),
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Store Name",
                        style: AppTextStyles.kBody15SemiboldTextStyle
                            .copyWith(color: AppColors.white100),
                      ),
                      Text(
                        "Store Address",
                        style: AppTextStyles.kCaption12RegularTextStyle
                            .copyWith(color: AppColors.white100),
                      ),
                    ],
                  ),
                  Spacer(),
                  Column(
                    children: [
                      Text(
                        "Customer Name",
                        style: AppTextStyles.kBody15SemiboldTextStyle
                            .copyWith(color: AppColors.white100),
                      ),
                      Align(
                        alignment: AlignmentDirectional.centerEnd,
                        child: Text(
                          "Customer Address",
                          style: AppTextStyles.kCaption12RegularTextStyle
                              .copyWith(color: AppColors.white100),
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              Row(
                children: [
                  InkWell(
                    onTap: (){
                      Utils.openMap("Food near me");
                    },
                    child: Image.asset(
                      orderlocation,
                      height: 30,
                      width: 30,
                    ),
                  ),
                  GestureDetector(
                      onTap: ontapCalltoStore,
                      child: Icon(Icons.phone_in_talk_outlined,size: 30,)),
                  Spacer(),
                  InkWell(
                    onTap: (){
                      Utils.openMap("Food near me");
                    },
                    child: Image.asset(
                      orderlocation,
                      height: 30,
                      width: 30,
                    ),
                  ),
                  GestureDetector(
                      onTap: ontapCalltoCustomer,
                      child: Icon(Icons.phone_in_talk_outlined,size: 30,)),
                ],
              ),
              Row(
                children: [
                  Column(
                    children: [
                      InkWell(
                        onTap: (){
                          Utils.DialogBox(context,messagealert, "",
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(backgroundColor: AppColors.primary1),
                              child: Text('Confirm'),
                              onPressed: () {
                              },
                            ),
                          );
                        },
                        child: ConstantContainer(
                          height: size.height * .035,
                          width: size.width * .3,
                          color: color,
                          radiusBorder: 10,
                          child: Center(
                            child: Text(
                              text,
                              style: AppTextStyles.kBody15SemiboldTextStyle
                                  .copyWith(color:textColor),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  Column(
                    children: [
                      ConstantContainer(
                        height: size.height * .048,
                        width: 2,
                        color: AppColors.white100,
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 2,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("₹180.80",
                          style: AppTextStyles.kBody17SemiboldTextStyle
                              .copyWith(color: AppColors.white100)),
                      Text(
                        "COD",
                        style: AppTextStyles.kBody15RegularTextStyle
                            .copyWith(color: AppColors.white100),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
