
import 'package:aagyodeliverypartners/landing_page/bottom_screen_pages/more/profile/view/recentactivity.dart';
import 'package:aagyodeliverypartners/landing_page/bottom_screen_pages/more/profile/view/viewall.dart';
import 'package:flutter/material.dart';

import '../../../../../colors/colors_const.dart';
import '../../../../../const/constString.dart';
import '../../../../../styles/textstyle_const.dart';

class WalletPageScreen extends StatefulWidget {
  const WalletPageScreen({super.key});

  @override
  State<WalletPageScreen> createState() => _WalletPageScreenState();
}

class _WalletPageScreenState extends State<WalletPageScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.primary,
        leading: IconButton(
          onPressed: () {
            // Get.back();
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: AppColors.white,
          ),
        ),
        centerTitle: true,
        title: Text(
          'Payout',
          style: AppTextStyles.kBody15SemiboldTextStyle.copyWith(
            color: AppColors.white,
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.help_outline,
                color: AppColors.white,
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              children: [
                const Divider(
                  color: Colors.white,
                  height: 1,
                ),
                Container(
                  height: size.height * 0.22,
                  width: size.width,
                  decoration: const BoxDecoration(
                    color: AppColors.primary,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, top: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Total Balance',
                          style: AppTextStyles.kBody15RegularTextStyle
                              .copyWith(color: AppColors.white),
                        ),
                        Text(
                          '₹500',
                          style: AppTextStyles.kLargeTitleTextStyle
                              .copyWith(color: AppColors.white),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.16,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Recent Activity',
                        style: AppTextStyles.kBody17SemiboldTextStyle,
                      ),

                      TextButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>ViewAll()));
                        },
                        child: Text(
                          'view all',
                          style: AppTextStyles.kCaption12RegularTextStyle
                              .copyWith(color: AppColors.primary),
                        ),
                      )
                    ],
                  ),
                ),
                ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 1,
                    itemBuilder: (BuildContext contex,index){
                  return Container(
                    color: Colors.white,
                    child: Column(
                      children: [
                        ListTile(
                          leading: Image.asset(success),
                          title: const Text(
                            'Cash Deposit Success',
                            style: AppTextStyles.kCaption12RegularTextStyle,
                          ),
                          subtitle: Row(
                            children: const [
                              Text('25/01/23'),
                              SizedBox(
                                width: 10,
                              ),
                              Text('09:30pm')
                            ],
                          ),
                          trailing: const Text(
                            '₹500',
                            style: AppTextStyles.kBody15SemiboldTextStyle,
                          ),
                        ),const Divider(
                          color: AppColors.white40,
                        ),
                        ListTile(
                          leading: Image.asset(desposit),
                          title: const Text(
                            'Cash Deposit failed !',
                            style: AppTextStyles.kCaption12RegularTextStyle,
                          ),
                          subtitle: Row(
                            children: const [
                              Text('25/01/23'),
                              SizedBox(
                                width: 10,
                              ),
                              Text('09:30pm')
                            ],
                          ),
                          trailing: const Text(
                            '₹500',
                            style: AppTextStyles.kBody15SemiboldTextStyle,
                          ),
                        ),
                      ],
                    ),
                  );
                }),
              ],
            ),
            Positioned(
              top: size.height * 0.11,
              left: size.width * 0.05,
              child: const RecentActivity(),
            )
          ],
        ),
      ),
    );
  }
}
