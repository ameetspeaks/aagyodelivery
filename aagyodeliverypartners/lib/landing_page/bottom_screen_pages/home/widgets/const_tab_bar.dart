import 'package:aagyodeliverypartners/landing_page/bottom_screen_pages/home/widgets/const_order_container.dart';
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
  // int currentIndex=1;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    TabController tabController = TabController(length: 4, vsync: this);

    return Column(
      children: [
        TabBar(
          indicatorColor: Colors.transparent,
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
            physics: const NeverScrollableScrollPhysics(),
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
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return ConstOrderContainer(color: color[index],text: name[index],textColor: AppColors.white,);
        });
  }
}

class ReadyToPick extends StatelessWidget {
  const ReadyToPick({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 3,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return ConstOrderContainer(color: AppColors.sucess100,text: "Ready to Pick",textColor: AppColors.white,);
        });
  }
}

class OnTheWay extends StatelessWidget {
  const OnTheWay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 3,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return ConstOrderContainer(color: AppColors.sucess100,text: "On the Way",textColor: AppColors.white,);
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
          return ConstOrderContainer(color: AppColors.white50,text: "Delivered",textColor: AppColors.white,);
        });
  }
}

