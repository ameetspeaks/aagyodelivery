import 'package:aagyodeliverypartners/landing_page/bottom_screen_pages/wallet/views/recentactivity.dart';
import 'package:aagyodeliverypartners/landing_page/bottom_screen_pages/wallet/views/viewall.dart';
import 'package:flutter/material.dart';
import '../../../../colors/colors_const.dart';
import '../../../../const/constString.dart';
import '../../../../styles/textstyle_const.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({super.key});

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.primary,
        centerTitle: true,
        title: Text(
          'Wallet',
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
                    itemCount: 3,
                    itemBuilder: (BuildContext contex,index){
                  return Container(
                    color: AppColors.white20,
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
                        ),
                        (index<2)? Divider(color: AppColors.white40,):SizedBox(height: 0,)
                      ],
                    ),
                  );
                }),
              ],
            ),
            Positioned(
              top: size.height * 0.11,
              left: size.width * 0.05,
              child: const RechargeWallet(),
            )
          ],
        ),
      ),
    );
  }
}
