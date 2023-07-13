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
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    TabController tabController = TabController(length: 4, vsync: this);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        centerTitle: true,
        title: Text("Order",style: AppTextStyles.kBody15SemiboldTextStyle.copyWith(color: AppColors.white),),
      ),
      body: Column(
        children: [
          SizedBox(height: 10,),
          TabBar(
            indicatorSize: TabBarIndicatorSize.label,
            indicator: BoxDecoration(
              border: Border.all(color: AppColors.sucess100,width: 2),
                borderRadius: BorderRadius.circular(10)
            ),
            indicatorColor: Colors.black,
            isScrollable: true,
            controller: tabController,
            tabs: [
              ConstantContainer(
                height: size.height * .035,
                color: AppColors.primary1,
                radiusBorder: 10,
                child: Center(
                  child: Tab(
                    child: Text(
                      "  20 | All  ",
                      style: AppTextStyles.kBody15SemiboldTextStyle
                          .copyWith(color: AppColors.white),
                    ),
                  ),
                ),
              ),
              ConstantContainer(
                // width: size.width*.2,
                height: size.height * .035,
                color: AppColors.primary1,
                radiusBorder: 10,
                child: Center(
                  child: Tab(
                    child: Text(
                      " 07 | Ready to Pick ",
                      style: AppTextStyles.kBody15SemiboldTextStyle
                          .copyWith(color: AppColors.white),
                    ),
                  ),
                ),
              ),
              ConstantContainer(
                // width: size.width*.2,
                height: size.height * .035,
                color: AppColors.primary1,
                radiusBorder: 10,
                child: Center(
                  child: Tab(
                    child: Text(
                      " 07 | On the Way ",
                      style: AppTextStyles.kBody15SemiboldTextStyle
                          .copyWith(color: AppColors.white),
                    ),
                  ),
                ),
              ),
              ConstantContainer(
                // width: size.width*.2,
                height: size.height * .035,
                color: AppColors.primary1,
                radiusBorder: 10,
                child: Center(
                  child: Tab(
                    child: Text(
                      " 07 | Delivered ",
                      style: AppTextStyles.kBody15SemiboldTextStyle
                          .copyWith(color: AppColors.white),
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
    );
  }
}

class AllOrder extends StatelessWidget {
  const AllOrder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List name =[
      "Ready to Pick",
      "On the Way",
      "Delivered",
    ];
    List color = [
      AppColors.sucess100,
      AppColors.sucess100,
      AppColors.white50,
    ];
    Size size = MediaQuery.of(context).size;
    return ListView.builder(
        itemCount: 3,
        shrinkWrap: true,
        physics: ScrollPhysics(),
        itemBuilder: (context, index) {
          return ConstOrderContainer(color: color[index],text: name[index],textColor: AppColors.white,);
        });
  }
}

class ReadyToPickOrder extends StatelessWidget {
  const ReadyToPickOrder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 8,
        shrinkWrap: true,
        physics: ScrollPhysics(),
        itemBuilder: (context, index) {
          return ConstOrderContainer(color: AppColors.sucess100,text: "Ready to Pick",textColor: AppColors.white,);
        });
  }
}

class OnTheWayOrder extends StatelessWidget {
  const OnTheWayOrder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 8,
        shrinkWrap: true,
        physics: ScrollPhysics(),
        itemBuilder: (context, index) {
          return ConstOrderContainer(color: AppColors.sucess100,text: "On the Way",textColor: AppColors.white,);
        });
  }
}

class DeliveredOrder extends StatelessWidget {
  const DeliveredOrder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 8,
        shrinkWrap: true,
        physics: ScrollPhysics(),
        itemBuilder: (context, index) {
          return ConstOrderContainer(color: AppColors.white50,text: "Delivered",textColor: AppColors.white,);
        });
  }
}

