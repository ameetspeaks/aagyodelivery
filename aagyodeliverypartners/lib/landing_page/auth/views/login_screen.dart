import 'package:aagyodeliverypartners/colors/colors_const.dart';
import 'package:aagyodeliverypartners/landing_page/auth/views/forgot_page.dart';
import 'package:aagyodeliverypartners/landing_page/auth/views/register_page.dart';
import 'package:aagyodeliverypartners/landing_page/auth/widgets/const_pinput.dart';
import 'package:aagyodeliverypartners/landing_page/bottomnavbar.dart';
import 'package:aagyodeliverypartners/styles/textstyle_const.dart';
import 'package:aagyodeliverypartners/utils/Utils.dart';
import 'package:flutter/material.dart';
import '../../../const/constString.dart';
import '../widgets/const_button.dart';
import '../widgets/const_text_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _obscureText = true;
  @override
  final formGlobalKey = GlobalKey<FormState>();

  Widget build(BuildContext context) {

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: formGlobalKey,
            child: Column(
              children: [
                Image.asset(
                  applogo,
                  height: 150,
                  width: 150,
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  "Login to AAGYO Delivery Boy App!",
                  style: AppTextStyles.kHeading3TextStyle
                      .copyWith(color: AppColors.primary),
                ),
                SizedBox(
                  height: 50,
                ),
                Text(
                    'Please login to access your account',
                  style: AppTextStyles.kBody17SemiboldTextStyle
                      .copyWith(color: AppColors.white70),
                ),
                SizedBox(
                  height: 20,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Mobile Number",
                    style: AppTextStyles.kBody15SemiboldTextStyle
                        .copyWith(color: AppColors.white100),
                  ),
                ),
                SizedBox(height: 10,),
                ConstTextfield(
                  hinttext: "Enter Your Mobile Number",
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
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Enter Your PIN",
                    style: AppTextStyles.kBody15SemiboldTextStyle
                        .copyWith(color: AppColors.white100),
                  ),
                ),
                SizedBox(height: 5,),
                ConstPinPut(
                  obsure: _obscureText,
                  totallength: 6,  validator: (number) {
                  if (number!.isEmpty || number.length<6 ) {
                    return "Pin must contain 6 digits";
                  } else {
                    return null;
                  }
                },),
                SizedBox(height: 10,),
                InkWell(
                  onTap: (){
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                  child: Container(
                    height: 20,
                    width: 180,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                         Icon(
                            !_obscureText ? Icons.visibility : Icons.visibility_off,
                            color: Colors.grey,
                          ),
                        SizedBox(width: 8),
                        Text(
                          !_obscureText ?"Hide Password":'Show Password',
                          style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                InkWell(
                    onTap: () {
                      if (formGlobalKey.currentState!.validate()) {
                        Utils.nevergoTo(context, Bottom_Page());
                      }
                    },
                    child: ConstButton(
                      text: "Login",
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton(
                        onPressed: () {
                          Utils.goTo(context, RegisterPage());
                        },
                        child: Text(
                          "Register?",
                          style: AppTextStyles.kBody15RegularTextStyle
                              .copyWith(color: AppColors.primary1),
                        )),
                    TextButton(
                        onPressed: () {
                          Utils.goTo(context, ForgotPage());
                        },
                        child: Text(
                          "Forgot Pin?",
                          style: AppTextStyles.kBody15RegularTextStyle
                              .copyWith(color: AppColors.error40),
                        )),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
