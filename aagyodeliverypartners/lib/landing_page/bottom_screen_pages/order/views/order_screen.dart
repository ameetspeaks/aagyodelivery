import 'package:aagyodeliverypartners/const/const_dropdown.dart';
import 'package:aagyodeliverypartners/landing_page/bottom_screen_pages/home/widgets/const_order_container.dart';
import 'package:aagyodeliverypartners/utils/Utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../../colors/colors_const.dart';
import '../../../../const/constContainer.dart';
import '../../../../styles/textstyle_const.dart';
import '../../../auth/widgets/const_text_field.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen>
    with TickerProviderStateMixin {
  String selectedValue = "Today";
  final TextEditingController _dateController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    DateTime? selectedDate;

    Future<void> _selectDate(BuildContext context) async {
      final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2100),
      );
      if (picked != null && picked != selectedDate) {
        setState(() {
          selectedDate = picked;
          _dateController.text =
          '${DateFormat('dd/MM/yyyy').format(selectedDate!)}';
        });
      }
    }
    Size size = MediaQuery.of(context).size;
    TabController tabController = TabController(length: 4, vsync: this);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        centerTitle: true,
        title: Text(
          "All Orders",
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0,15,5,0),
            child: ConstantContainer(
              height: size.height*.06,
              width: size.width*.3,
              // color: Colors.red,
              child: ConstTextfield(
                ontap: (){
                  _selectDate(context);
                },
                controller: _dateController,
                readyonly: true,
                enableBorderColor: AppColors.white,
                hintstyle: AppTextStyles.kCaption12SemiboldTextStyle.copyWith(color: AppColors.white),
                style: AppTextStyles.kBody15SemiboldTextStyle.copyWith(color: AppColors.white),
                inputtype: TextInputType.datetime,
                hinttext: "Choose Date",
              ),
            ),

            // ConstantDropdown(
            //   dropdownColor: AppColors.primary,
            //   textColor: AppColors.white,
            //   iconColor: AppColors.white,
            //   options: const ['Today', 'Yesterday', 'This Week','This Month'],
            //   selectedOption: selectedValue,
            //   onChanged: (newValue) {
            //     setState(() {
            //       selectedValue = newValue;
            //     });
            //     // if(selectedValue=='Choose Date'){
            //     //   _selectDate(context);
            //     // }
            //   },
            // ),
          ),
        ],
      ),
      body: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (notification) {
          notification.disallowIndicator();
          return true;
        },
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            TabBar(
              labelPadding: EdgeInsets.symmetric(horizontal: 5.0),
              indicatorSize: TabBarIndicatorSize.label,
              unselectedLabelColor: AppColors.white100,
              unselectedLabelStyle: AppTextStyles.kBody15SemiboldTextStyle,
              indicator: BoxDecoration(
                  color: AppColors.primary1,
                  borderRadius: BorderRadius.circular(6)),
              indicatorColor: Colors.black,
              isScrollable: true,
              controller: tabController,
              tabs: [
                ConstantContainer(
                  height: size.height * .03,
                  borderWidth: 1,
                  borderColor: AppColors.primary1,
                  radiusBorder: 6,
                  child: Center(
                    child: Tab(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Text(
                          "20 | All",style: AppTextStyles.kCaption12SemiboldTextStyle,
                        ),
                      ),
                    ),
                  ),
                ),
                ConstantContainer(
                  height: size.height * .03,
                  borderWidth: 1,
                  borderColor: AppColors.primary1,
                  radiusBorder: 6,
                  child: Center(
                    child: Tab(
                      child:  Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Text(
                          " 07 | Ready to Pick ",style: AppTextStyles.kCaption12SemiboldTextStyle,
                        ),
                      ),
                    ),
                  ),
                ),
                ConstantContainer(
                  height: size.height * .03,
                  borderWidth: 1,
                  borderColor: AppColors.primary1,
                  radiusBorder: 6,
                  child: Center(
                    child: Tab(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Text(
                          " 07 | On the Way ",style: AppTextStyles.kCaption12SemiboldTextStyle,
                        ),
                      ),
                    ),
                  ),
                ),
                ConstantContainer(
                  height: size.height * .03,
                  borderWidth: 1,
                  borderColor: AppColors.primary1,
                  radiusBorder: 6,
                  child: Center(
                    child: Tab(
                      child:  Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Text(
                          " 07 | Delivered ",style: AppTextStyles.kCaption12SemiboldTextStyle,
                        ),
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
    List name = [
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
        itemCount: name.length + 1,
        shrinkWrap: true,
        physics: ScrollPhysics(),
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

class ReadyToPickOrder extends StatelessWidget {
  const ReadyToPickOrder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 1,
        shrinkWrap: true,
        physics: ScrollPhysics(),
        itemBuilder: (context, index) {
          return ConstOrderContainer(
            color: AppColors.sucess100,
            text: "Ready to Pick",
            textColor: AppColors.white,
            messagealert: 'Mark as Ready to PickUp', ontapCalltoStore: () { Utils.callNumber("198"); }, ontapCalltoCustomer: () { Utils.callNumber("555"); },
          );
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
          return ConstOrderContainer(
            color: AppColors.sucess100,
            text: "On the Way",
            textColor: AppColors.white,
            messagealert: 'Mark as On the way', ontapCalltoStore: () { Utils.callNumber("198"); }, ontapCalltoCustomer: () { Utils.callNumber("555"); },
          );
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
          return ConstOrderContainer(
            color: AppColors.white50,
            text: "Delivered",
            textColor: AppColors.white,
            messagealert: 'Mark as Delivered', ontapCalltoStore: () { Utils.callNumber("198"); }, ontapCalltoCustomer: () { Utils.callNumber("555"); },
          );
        });
  }
}
