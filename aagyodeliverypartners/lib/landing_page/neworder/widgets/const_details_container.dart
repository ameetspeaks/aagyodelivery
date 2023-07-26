import 'package:flutter/material.dart';
import '../../../colors/colors_const.dart';
import '../../../const/constContainer.dart';
import '../../../styles/textstyle_const.dart';
import '../../../utils/Utils.dart';

class ConstDetailContainer extends StatefulWidget {
  const ConstDetailContainer({Key? key}) : super(key: key);

  @override
  State<ConstDetailContainer> createState() => _ConstDetailContainerState();
}
bool showorder = false;
bool showCustomerDetails = false;
bool showRestaurantDetails = false;

class _ConstDetailContainerState extends State<ConstDetailContainer> {
  void orderDetails() {
    setState(() {
      showorder = !showorder;
    });
  }

  void customerDetails() {
    setState(() {
      showCustomerDetails = !showCustomerDetails;
    });
  }

  void restaurantDetails() {
    setState(() {
      showRestaurantDetails = !showRestaurantDetails;
    });
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
     children: [
       ConstantContainer(
         borderColor: AppColors.primary,
         child: ListTile(
           onTap: (){
             orderDetails();
           },
           leading: Icon(Icons.fastfood_outlined),
           title:  Text(
             "Order Details",
             style: AppTextStyles.kBody17SemiboldTextStyle
                 .copyWith(color: AppColors.white80),
           ),
           subtitle: Text(
             "Om Kali Restaurant",
             style: AppTextStyles.kCaption12RegularTextStyle
                 .copyWith(color: AppColors.white60),
           ),
           trailing:Icon(showorder?Icons.keyboard_arrow_up:Icons.keyboard_arrow_down),
         ),
       ),
       SizedBox(height: 10,),
       Visibility(
         visible: showorder,
         child: ConstantContainer(
             width: size.width,
             borderColor: AppColors.primary,
             child:Padding(
               padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 10),
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Text(" 1 X Hakka Noddles ",style: AppTextStyles.kBody15RegularTextStyle),
                   Text(" 4 X Cold Drink ",style: AppTextStyles.kBody15RegularTextStyle,)
                 ],
               ),
             )
         ),
       ),
       SizedBox(height:10),
       ConstantContainer(
         borderColor: AppColors.primary,
         child: ListTile(
           onTap: (){customerDetails();},
           leading: Icon(Icons.person),
           title:  Text(
             "Customer Details",
             style: AppTextStyles.kBody17SemiboldTextStyle
                 .copyWith(color: AppColors.white80),
           ),
           trailing:Icon(showCustomerDetails?Icons.keyboard_arrow_up:Icons.keyboard_arrow_down),
         ),
       ),
       SizedBox(height:10),
       Visibility(
         visible: showCustomerDetails,
         child: ConstantContainer(
             width: size.width,
             borderColor: AppColors.primary,
             child:Padding(
               padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 10),
               child:Column(
                 children: [
                   RichText(
                     text: TextSpan(
                       text: 'Order ID: ',
                       style: AppTextStyles.kBody15RegularTextStyle.copyWith(color: AppColors.white100),
                       children: [
                         TextSpan(
                           text: '4244555554',
                           style:AppTextStyles.kBody15SemiboldTextStyle.copyWith(color: AppColors.white100),
                         ),
                       ],
                     ),
                   ),
                   RichText(
                     text: TextSpan(
                       text: 'Customer: ',
                       style: AppTextStyles.kBody15RegularTextStyle.copyWith(color: AppColors.white100),
                       children: [
                         TextSpan(
                           text: 'Satyam Singh',
                           style:AppTextStyles.kBody15SemiboldTextStyle.copyWith(color: AppColors.white100),
                         ),
                       ],
                     ),
                   ),
                   SizedBox(height: 5,),
                   Row(
                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                     children: [
                       InkWell(
                         onTap: (){
                           Utils.callNumber("199");
                         },
                         child: ConstantContainer(
                           width: MediaQuery.of(context).size.width/2.3,
                           borderColor: AppColors.primary,
                           radiusBorder: 5,
                           child: Padding(
                             padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 8),
                             child: Center(child: Text("Call",style: AppTextStyles.kBody17RegularTextStyle.copyWith(color: AppColors.white100),)),
                           ),
                         ),
                       ),
                       InkWell(
                         onTap: (){
                           Utils.openMap("Biryani near me");
                         },
                         child: ConstantContainer(
                           width: MediaQuery.of(context).size.width/2.3,
                           color: AppColors.primary,
                           radiusBorder: 5,
                           child: Padding(
                             padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 8),
                             child: Center(child: Text("Go to Map",style: AppTextStyles.kBody17RegularTextStyle.copyWith(color: AppColors.white),)),
                           ),
                         ),
                       ),
                     ],
                   ),
                 ],
               ),
             )
         ),
       ),
       SizedBox(height:10),
       ConstantContainer(
         borderColor: AppColors.primary,
         child: ListTile(
           onTap: (){
             restaurantDetails();
           },
           leading: Icon(Icons.shop),
           title:  Text(
             "Restaurant Details",
             style: AppTextStyles.kBody17SemiboldTextStyle
                 .copyWith(color: AppColors.white80),
           ),
           trailing:Icon(showRestaurantDetails?Icons.keyboard_arrow_up:Icons.keyboard_arrow_down),
         ),
       ),
       SizedBox(height:10),
       Visibility(
         visible: showRestaurantDetails,
         child: ConstantContainer(
             width: size.width,
             borderColor: AppColors.primary,
             child:Padding(
               padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 10),
               child:Column(
                 children: [
                   RichText(
                     text: TextSpan(
                       text: 'Order ID: ',
                       style: AppTextStyles.kBody15RegularTextStyle.copyWith(color: AppColors.white100),
                       children: [
                         TextSpan(
                           text: '4244555554',
                           style:AppTextStyles.kBody15SemiboldTextStyle.copyWith(color: AppColors.white100),
                         ),
                       ],
                     ),
                   ),
                   RichText(
                     text: TextSpan(
                       text: 'Restaurant Name: ',
                       style: AppTextStyles.kBody15RegularTextStyle.copyWith(color: AppColors.white100),
                       children: [
                         TextSpan(
                           text: 'Om Kali Restaurant',
                           style:AppTextStyles.kBody15SemiboldTextStyle.copyWith(color: AppColors.white100),
                         ),
                       ],
                     ),
                   ),
                   SizedBox(height: 5,),
                   Row(
                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                     children: [
                       InkWell(
                         onTap: (){
                           Utils.callNumber("199");
                         },
                         child: ConstantContainer(
                           width: MediaQuery.of(context).size.width/2.3,
                           borderColor: AppColors.primary,
                           radiusBorder: 5,
                           child: Padding(
                             padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 8),
                             child: Center(child: Text("Call",style: AppTextStyles.kBody17RegularTextStyle.copyWith(color: AppColors.white100),)),
                           ),
                         ),
                       ),
                       InkWell(
                         onTap: (){
                           Utils.openMap("Biryani near me");
                         },
                         child: ConstantContainer(
                           width: MediaQuery.of(context).size.width/2.3,
                           color: AppColors.primary,
                           radiusBorder: 5,
                           child: Padding(
                             padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 8),
                             child: Center(child: Text("Go to Map",style: AppTextStyles.kBody17RegularTextStyle.copyWith(color: AppColors.white),)),
                           ),
                         ),
                       ),
                     ],
                   ),
                 ],
               ),
             )
         ),
       ),
       SizedBox(height: 20,),
     ],
    );
  }
}
