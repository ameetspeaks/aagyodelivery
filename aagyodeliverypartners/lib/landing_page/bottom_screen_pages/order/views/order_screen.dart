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
  TextEditingController _dateController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    DateTime? selectedDate;

    Future<void> _selectDate(BuildContext context,) async {
      final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate ??DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2100),
      );
      if (picked != null && picked != selectedDate) {
        setState(() {
          selectedDate = picked;
          selectedValue=
              DateFormat('dd/MM/yyyy').format(selectedDate!);
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
            padding: const EdgeInsets.all(8.0),
            child: ConstantDropdown(
              dropdownColor: AppColors.primary,
              textColor: AppColors.white,
              iconColor: AppColors.white,
              options: ['Today', 'Yesterday', 'Choose Date'],
              selectedOption: selectedValue,
              onChanged: (newValue) {
                setState(() {
                  selectedValue = newValue;
                  if(selectedValue=='Choose Date'){
                    ConstTextfield(
                      controller: _dateController,
                      validator: (number) {
                        if (number.isEmpty && selectedDate==null ) {
                          return "Please Select Date";}
                        else{
                          return null;
                        }
                      },
                      inputtype: TextInputType.datetime,
                      hinttext:"Enter Your DOB(same as in Aadhar)",
                      suffixicon: IconButton(
                          onPressed: () {
                            _selectDate(context);
                          },
                          icon: Icon(Icons.calendar_month_outlined)),
                    );
                  }
                });
              },
            ),
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
              indicatorSize: TabBarIndicatorSize.label,
              unselectedLabelColor: AppColors.white100,
              unselectedLabelStyle: AppTextStyles.kBody15SemiboldTextStyle,
              indicator: BoxDecoration(
                  color: AppColors.primary1,
                  borderRadius: BorderRadius.circular(10)),
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
