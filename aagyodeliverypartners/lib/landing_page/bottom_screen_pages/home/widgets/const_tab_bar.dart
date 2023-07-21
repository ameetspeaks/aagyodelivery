import 'package:aagyodeliverypartners/landing_page/bottom_screen_pages/home/widgets/const_order_container.dart';
import 'package:aagyodeliverypartners/utils/Utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../colors/colors_const.dart';
import '../../../../const/constContainer.dart';
import '../../../../styles/textstyle_const.dart';

class ConstTabBar extends StatefulWidget {
  const ConstTabBar({Key? key}) : super(key: key);

  @override
  State<ConstTabBar> createState() => _ConstTabBarState();
}

class _ConstTabBarState extends State<ConstTabBar>
    with TickerProviderStateMixin {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    TabController tabController = TabController(length: 4, vsync: this);

    return Column(
      children: [
        TabBar(
         indicatorSize: TabBarIndicatorSize.label,
          indicator: BoxDecoration(
              color: AppColors.primary1,
              borderRadius: BorderRadius.circular(10)
          ),
          isScrollable: true,
          unselectedLabelColor: AppColors.white100,
          unselectedLabelStyle: AppTextStyles.kBody15SemiboldTextStyle,
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
                  ),
                ),
              ),
            ),
            ConstantContainer(
             height: size.height * .035,
                borderWidth: 1,
                borderColor: AppColors.primary1,
                radiusBorder: 10,
              child: Center(
                child: Tab(
                  child: Text(
                    " 07 | On the Way ",
                  ),
                ),
              ),
            ),
            ConstantContainer(
             height: size.height * .035,
                borderWidth: 1,
                borderColor: AppColors.primary1,
                radiusBorder: 10,
              child: Center(
                child: Tab(
                  child: Text(
                    " 07 | Delivered ",
                  ),
                ),
              ),
            ),
          ],
        ),
        Expanded(
          child: TabBarView(
            physics: ScrollPhysics(),
            controller: tabController,
            children: [
              All(),
              ReadyToPick(),
              OnTheWay(),
              Delivered(),
            ],
          ),
        )
      ],
    );
  }
}

class All extends StatelessWidget {
  const All({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List name =[
      ReadyToPick(),
      OnTheWay(),
      Delivered(),
    ];

    Size size = MediaQuery.of(context).size;
    return ListView.builder(
        itemCount: name.length,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          var length = name.length;
          return index < length
              ? name[index]
              : SizedBox(
            height: size.height * .25,
          );
        });
  }
}

class ReadyToPick extends StatelessWidget {
  const ReadyToPick({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 1,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return ConstOrderContainer(color: AppColors.sucess100,text: "Ready to Pick",textColor: AppColors.white, messagealert: 'Mark as Ready to PickUp', ontapCalltoStore: (){  Utils.callNumber("198");}, ontapCalltoCustomer: () {Utils.callNumber("555");  },);
        });
  }
}

class OnTheWay extends StatelessWidget {
  const OnTheWay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 1,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return ConstOrderContainer(color: AppColors.sucess100,text: "On the Way",textColor: AppColors.white, messagealert: 'Mark as One the Way', ontapCalltoStore: () { Utils.callNumber("121"); }, ontapCalltoCustomer: () { Utils.callNumber("555"); },);
        });
  }
}

class Delivered extends StatelessWidget {
  const Delivered({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 3,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return ConstOrderContainer(color: AppColors.white50,text: "Delivered",textColor: AppColors.white, messagealert: 'Mark as Delivered', ontapCalltoStore: () { Utils.callNumber("198"); }, ontapCalltoCustomer: () { Utils.callNumber("555"); },);
        });
  }
}

