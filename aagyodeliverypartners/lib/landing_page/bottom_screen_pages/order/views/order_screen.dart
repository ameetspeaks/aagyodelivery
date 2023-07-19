import 'package:aagyodeliverypartners/const/const_dropdown.dart';
import 'package:aagyodeliverypartners/landing_page/bottom_screen_pages/home/widgets/const_order_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../colors/colors_const.dart';
import '../../../../const/constContainer.dart';
import '../../../../styles/textstyle_const.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen>
    with TickerProviderStateMixin {
  String selectedValue2 = "Choose Date";
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    TabController tabController = TabController(length: 4, vsync: this);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        centerTitle: true,
        title: Text("All Order",style: AppTextStyles.kBody15SemiboldTextStyle.copyWith(color: AppColors.white),),
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ConstantDropdown(
            dropdownColor: AppColors.primary,
            textColor: AppColors.white,
            iconColor: AppColors.white,
            options: ['Today', 'Yesterday', 'Choose Date'],
            selectedOption: selectedValue2,
            onChanged: (newValue) {
              setState(() {
                selectedValue2 = newValue;
              });
            },
          ),
        ),
      ],
      ),
      body: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (notification){
          notification.disallowIndicator();
          return true;
        },
        child: Column(
          children: [
            SizedBox(height: 10,),
            TabBar(
              indicatorSize: TabBarIndicatorSize.label,
              indicator: BoxDecoration(
                color: AppColors.primary1,
                  borderRadius: BorderRadius.circular(10)
              ),
              indicatorColor: Colors.black,
              isScrollable: true,
              controller: tabController,
              tabs: [
                ConstantContainer(
                  height: size.height * .035,
                  borderWidth: 1,
                  borderColor: AppColors.primary1,
                  radiusBorder: 10,
                  child: Center(
                    child: Tab(
                      child: Text(
                        "  20 | All  ",
                        style: AppTextStyles.kBody15SemiboldTextStyle
                            .copyWith(color: AppColors.white80),
                      ),
                    ),
                  ),
                ),
                ConstantContainer(
                  // width: size.width*.2,
                  height: size.height * .035,
                  borderWidth: 1,
                  borderColor: AppColors.primary1,
                  radiusBorder: 10,
                  child: Center(
                    child: Tab(
                      child: Text(
                        " 07 | Ready to Pick ",
                        style: AppTextStyles.kBody15SemiboldTextStyle
                            .copyWith(color: AppColors.white80),
                      ),
                    ),
                  ),
                ),
                ConstantContainer(
                  // width: size.width*.2,
                  height: size.height * .035,
                  borderWidth: 1,
                  borderColor: AppColors.primary1,
                  radiusBorder: 10,
                  child: Center(
                    child: Tab(
                      child: Text(
                        " 07 | On the Way ",
                        style: AppTextStyles.kBody15SemiboldTextStyle
                            .copyWith(color: AppColors.white80),
                      ),
                    ),
                  ),
                ),
                ConstantContainer(
                  // width: size.width*.2,
                  height: size.height * .035,
                  borderWidth: 1,
                  borderColor: AppColors.primary1,
                  radiusBorder: 10,
                  child: Center(
                    child: Tab(
                      child: Text(
                        " 07 | Delivered ",
                        style: AppTextStyles.kBody15SemiboldTextStyle
                            .copyWith(color: AppColors.white80),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: TabBarView(
                physics:  ScrollPhysics(),
                controller: tabController,
                children: [
                  AllOrder(),
                  ReadyToPickOrder(),
                  OnTheWayOrder(),
                  DeliveredOrder(),

                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class AllOrder extends StatelessWidget {
  const AllOrder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List name =[
    ReadyToPickOrder(),
      OnTheWayOrder(),
      DeliveredOrder(),
    ];
    List color = [
      AppColors.sucess100,
      AppColors.sucess100,
      AppColors.white50,
    ];
    Size size = MediaQuery.of(context).size;
    return ListView.builder(
        itemCount: name.length+1,
        shrinkWrap: true,
        physics: ScrollPhysics(),
        itemBuilder: (context, index) {
         var length= name.length;
          return index<length?name[index]:SizedBox(height: size.height*.25,);
        });
  }
}

class ReadyToPickOrder extends StatelessWidget {
  const ReadyToPickOrder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 1,
        shrinkWrap: true,
        physics: ScrollPhysics(),
        itemBuilder: (context, index) {
          return ConstOrderContainer(color: AppColors.sucess100,text: "Ready to Pick",textColor: AppColors.white, messagealert: 'Mark as Ready to PickUp',);
        });
  }
}

class OnTheWayOrder extends StatelessWidget {
  const OnTheWayOrder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 1,
        shrinkWrap: true,
        physics: ScrollPhysics(),
        itemBuilder: (context, index) {
          return ConstOrderContainer(color: AppColors.sucess100,text: "On the Way",textColor: AppColors.white, messagealert: 'Mark as On the way',);
        });
  }
}

class DeliveredOrder extends StatelessWidget {
  const DeliveredOrder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 3,
        shrinkWrap: true,
        physics: ScrollPhysics(),
        itemBuilder: (context, index) {
          return ConstOrderContainer(color: AppColors.white50,text: "Delivered",textColor: AppColors.white, messagealert: 'Mark as Delivered',);
        });
  }
}

