import 'package:aagyodeliverypartners/landing_page/bottom_screen_pages/wallet/views/wallet.dart';
import 'package:aagyodeliverypartners/utils/Utils.dart';
import 'package:flutter/material.dart';
import '../../../../../../colors/colors_const.dart';
import '../../../../styles/textstyle_const.dart';

class RechargeWallet extends StatefulWidget {
  const RechargeWallet({Key? key}) : super(key: key);

  @override
  State<RechargeWallet> createState() => _RechargeWalletState();
}

class _RechargeWalletState extends State<RechargeWallet> {
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.25,
      width: size.width * 0.9,
      decoration: BoxDecoration(
          color: AppColors.white30,
          borderRadius: BorderRadius.circular(10),
          ),
      child: Padding(
        padding:
        const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                 Text(
                      'Amount',
                      style: AppTextStyles.kBody17SemiboldTextStyle,
                    ),
                  ],
                ),
                Spacer(),
                Text(
                  '₹500',
                  style: AppTextStyles.kBody15SemiboldTextStyle,
                ),
              ],
            ),
            Container(
              height: 45,
              child: TextFormField(
                controller: _controller,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  fillColor: AppColors.white30,
                  filled: true,
                  hintStyle: TextStyle(color: AppColors.neutralLightFonts),
                  hintText: "1000",

                  contentPadding:
                  EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.white10)),
                ),
              ),
            ),
            SizedBox(
              height: 40,
              width: size.width * 0.85,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary),
                  onPressed: () {
                    // Utils.goTo(context, WalletScreen());
                  },
                  child: Text(
                    'Recharge Your Wallet',
                    style: AppTextStyles.kBody15SemiboldTextStyle
                        .copyWith(color: AppColors.white),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
// class PriceContainer extends StatelessWidget {
//   final String price;
//   final TextEditingController controller;
//   final ValueNotifier<PriceContainer?> selectedContainer;
//
//   PriceContainer({
//     super.key,
//     required this.price,
//     required this.controller,
//     required this.selectedContainer,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return ValueListenableBuilder(
//       valueListenable: selectedContainer,
//       builder: (context, value, _) {
//         return GestureDetector(
//           onTap: () {
//             controller.text = price;
//
//             if (value != null) {
//               value.isSelected = false;
//             }
//
//             isSelected = true;
//             selectedContainer.value = this;
//           },
//           child: Container(
//             padding: const EdgeInsets.all(10),
//             decoration: BoxDecoration(
//               color: isSelected ? AppColors.primary : Colors.grey[300],
//               borderRadius: BorderRadius.circular(50),
//             ),
//             child: Text(
//               '₹$price',
//               style: TextStyle(
//                 color: isSelected ? AppColors.white : Colors.black,
//                 fontSize: 15,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
//
//   bool _isSelected = false;
//   bool get isSelected => _isSelected;
//   set isSelected(bool value) {
//     _isSelected = value;
//   }
// }
