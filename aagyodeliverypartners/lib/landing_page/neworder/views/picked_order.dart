import 'dart:async';
import 'package:aagyodeliverypartners/landing_page/neworder/views/reached_drop_location.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../colors/colors_const.dart';
import '../../../const/constContainer.dart';
import '../../../styles/textstyle_const.dart';
import '../../../utils/Utils.dart';
import '../widgets/const_details_container.dart';
import '../widgets/slide_button_constant.dart';

class PickedOrder extends StatefulWidget {
  const PickedOrder({Key? key}) : super(key: key);

  @override
  State<PickedOrder> createState() => _PickedOrderState();
}
bool showorder = false;
bool showCustomerDetails = false;
bool showRestaurantDetails = false;

class _PickedOrderState extends State<PickedOrder> {
  @override
  late Timer _timer;
  int min = 2;
  int _elapsedSeconds = 0;

  @override
  void initState() {
    super.initState();
    // Start the timer when the screen is loaded
    _startTimer();
  }

  void _startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = Timer.periodic(oneSec, (Timer timer) {
      setState(() {
        if (_elapsedSeconds < min * 60) {
          _elapsedSeconds++;
        } else {
          _timer.cancel();
        }
      });
    });
  }

  String getFormattedTime(int totalSeconds) {
    int minutes = totalSeconds ~/ 60;
    int seconds = totalSeconds % 60;
    return '$minutes.${seconds.toString().padLeft(2, '0')}';
  }

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
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        centerTitle: true,
        title: Text(
          'PickUp Order',
        ),
      ),

      body: SafeArea(child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(height: 20,),
            ConstantContainer(
                color: AppColors.white50,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ConstantContainer(
                        color: AppColors.primary,
                        radiusBorder: 2,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 3.0,horizontal: 15),
                         child:Text(
                            '${getFormattedTime(min * 60 - _elapsedSeconds)}',
                            style:AppTextStyles.kBody15SemiboldTextStyle.copyWith(color: AppColors.white),
                          ),
                        ),
                      ),
                      Text(
                        "Order is ready, pick now!",
                        style: AppTextStyles.kBody15RegularTextStyle
                            .copyWith(color: AppColors.white90),
                      ),
                    ],
                  ),
                )
            ),
            SizedBox(height: 10,),
            Text(
              "Order ID",
              style: AppTextStyles.kBody20RegularTextStyle
                  .copyWith(color: AppColors.white80),
            ),
            SizedBox(height: 5,),
            Text(
              "428542672555452",
              style: AppTextStyles.kHeading2TextStyle
                  .copyWith(color: AppColors.white80),
            ),
            SizedBox(height: 25,),
            ConstDetailContainer(),
            SliderButtonConst(text: 'Picked Order',widget:DropLocation(),)
          ],
        ),
      )),
    );
  }
}
