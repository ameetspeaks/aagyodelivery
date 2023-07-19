import 'package:aagyodeliverypartners/landing_page/auth/widgets/const_text_field.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../colors/colors_const.dart';
import '../../../styles/textstyle_const.dart';
import '../../../utils/Utils.dart';
import '../widgets/const_button.dart';
import 'gengerate_pin.dart';
import 'login_screen.dart';

class ForgotPage extends StatefulWidget {
  const ForgotPage({Key? key}) : super(key: key);

  @override
  State<ForgotPage> createState() => _ForgotPageState();
}

class _ForgotPageState extends State<ForgotPage> {
  DateTime? _dob;
  DateTime ?selectedDate;

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
      });
    }
  }
  String? _validateDob(DateTime? dateTime) {
    if (selectedDate == null) {
      return 'Please select Date';
    }
    return null;
  }
  @override
  Widget build(BuildContext context) {
    final formGlobalKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        centerTitle: true,
        title: Text(
          "Forgot Pin",
          style: AppTextStyles.kBody15SemiboldTextStyle
              .copyWith(color: AppColors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: formGlobalKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20,),
              Center(
                child: Text(
                  "Forgot Your Pin",
                  style: AppTextStyles.kHeading3TextStyle
                      .copyWith(color: AppColors.white70),
                ),
              ),
              SizedBox(height: 40,),
              constText("Mobile"),
              ConstTextfield(
                hinttext: "Enter Mobile Number",
                maxlength: 10,
                inputtype: TextInputType.phone,
                validator: (number) {
                  if (number!.isEmpty || number.length<9 ) {
                    return "Mobile must contain 10 digits";
                  } else {
                    return null;
                  }
                },
              ),
              SizedBox(
                height: 10,
              ),
              constText("Last 4 Digits of DL"),
              ConstTextfield(
                hinttext: "Enter Last 4 digits of Driving Licence(DL)",
                maxlength: 4,
                inputtype: TextInputType.phone,
                validator: (number) {
                  if (number!.isEmpty ) {
                    return "Enter valid data";
                  } else {
                    return null;
                  }
                },
              ),
              SizedBox(
                height: 10,
              ),
              constText("Date of Birth"),
              ConstTextfield(
                inputtype: TextInputType.datetime,
                validator: (value) => _validateDob(selectedDate),
                hinttext:  selectedDate != null
                    ? '${DateFormat('dd/MM/yyyy').format(selectedDate!)}':"Enter Your DOB(same as in Aadhar)",
                suffixicon: IconButton(
                    onPressed: () {
                      _selectDate(context);
                    },
                    icon: Icon(Icons.calendar_month_outlined)),
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: InkWell(
                    onTap: (){
                      if(formGlobalKey.currentState!.validate()){
                        Utils.goTo(context, GengeratePin());
                        Utils.showToastMsg("Reset Your Pin");
                      }
                    },
                    child: ConstButton(text: "Submit",)),
              )
            ],
          ),
        ),
      ),
    );
  }
  Widget constText(heading){
    return Text(
      heading,
      style: AppTextStyles.kBody15SemiboldTextStyle
          .copyWith(color: AppColors.white100),
    );
  }
}
