import 'package:aagyodeliverypartners/const/constContainer.dart';
import 'package:flutter/material.dart';
import '../../../../colors/colors_const.dart';
import '../../../../styles/textstyle_const.dart';

class PayoutHistory extends StatelessWidget {
  const PayoutHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        centerTitle: true,
        title: Text(
          "Daily Payout History",
          style: AppTextStyles.kBody15SemiboldTextStyle
              .copyWith(color: AppColors.white),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ConstantContainer(
            color: AppColors.primary1,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                          child: Text(
                        "Total Payout Transferred",
                        style: AppTextStyles.kBody20SemiboldTextStyle
                            .copyWith(color: AppColors.white),
                      )),
                      Text(
                        "₹200",
                        style: AppTextStyles.kBody20SemiboldTextStyle
                            .copyWith(color: AppColors.white),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  constRow("Weekly Earning", "₹2010"),
                  SizedBox(
                    height: 10,
                  ),
                  constRow("Floating cash deduction", "₹4152"),
                  SizedBox(
                    height: 40,
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8,8,8,0),
            child: Text("PAYOUT HISTORY",style: AppTextStyles.kBody17SemiboldTextStyle.copyWith(color: AppColors.white80),),
          ),
          ListView.builder(
              itemCount: 5,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context,index){
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: (){},
                child: ConstantContainer(
                  color: AppColors.primary,
                  radiusBorder: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            Text(
                              "Mon 26 Jun",
                              style: AppTextStyles.kBody17RegularTextStyle
                                  .copyWith(color: AppColors.white20),
                            ),
                            SizedBox(
                              width: 3,
                            ),
                            ConstantContainer(
                              color: AppColors.secondary1,
                              radiusBorder: 2,
                              child: Center(
                                  child: Text(
                                    " Done ",
                                    style: AppTextStyles.kCaption12RegularTextStyle
                                        .copyWith(color: AppColors.white20),
                                  )),
                            ),
                            Spacer(),
                            Text(
                              "₹12",
                              style: AppTextStyles.kBody17RegularTextStyle
                                  .copyWith(color: AppColors.white20),
                            ),
                            Icon(
                              Icons.arrow_forward_ios_sharp,
                              color: AppColors.white20,
                              size: 15,
                            )
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          })

        ],
      ),
    );
  }

  Widget constRow(text1, text2) {
    return Row(
      children: [
        Expanded(
            child: Text(
          text1,
          style: AppTextStyles.kBody15RegularTextStyle
              .copyWith(color: AppColors.white),
        )),
        // Spacer(),
        Text(
          text2,
          style: AppTextStyles.kBody15RegularTextStyle
              .copyWith(color: AppColors.white),
        ),
      ],
    );
  }
}
