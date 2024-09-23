import 'package:aagyodeliverypartners/colors/colors_const.dart';
import 'package:aagyodeliverypartners/landing_page/auth/views/forgot_page.dart';
import 'package:aagyodeliverypartners/landing_page/auth/views/register_page.dart';
import 'package:aagyodeliverypartners/landing_page/auth/widgets/const_pinput.dart';
import 'package:aagyodeliverypartners/landing_page/bottomnavbar.dart';
import 'package:aagyodeliverypartners/styles/textstyle_const.dart';
import 'package:aagyodeliverypartners/utils/Utils.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
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
  String ntoken = " ";

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    getToken();
  }
  @override

  void getToken() async{
    await FirebaseMessaging.instance.getToken().then((token){
      setState(() {
        ntoken=token!;
        print("my token is $ntoken");
      });

    } );
  }
  final formGlobalKey = GlobalKey<FormState>();

  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Utils.isloading?Utils().progressIndicator(context):Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(background),fit: BoxFit.cover)
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: formGlobalKey,
            child: Column(
              children: [
                const SizedBox(height: 20,),
                Image.asset(
                  applogo,
                  height: 150,
                  width: 150,
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  "Login to Parcelpe Delivery App!",
                  style: AppTextStyles.kHeading3TextStyle
                      .copyWith(color: AppColors.primary),
                ),
                const SizedBox(
                  height: 50,
                ),
                Text(
                    'Please login to access your account',
                  style: AppTextStyles.kBody17SemiboldTextStyle
                      .copyWith(color: AppColors.white70),
                ),
                const SizedBox(
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
                const SizedBox(height: 10),
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
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Text(
                      "Enter Your PIN",
                      style: AppTextStyles.kBody15SemiboldTextStyle
                          .copyWith(color: AppColors.white100),
                    ),
                    Spacer(),
                    GestureDetector(
                      onTap: (){
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                      child: Container(
                        height: 20,
                        width: 100,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              !_obscureText ? Icons.visibility : Icons.visibility_off,
                              color: Colors.grey,
                            ),
                            SizedBox(width: 8),
                            Text(
                              !_obscureText ?"Hide":'Show',
                              style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height:10 ),
                ConstPinPut(
                  obsure: _obscureText,
                  totallength: 6,  validator: (number) {
                  if (number!.isEmpty || number.length<6 ) {
                    return "Pin must contain 6 digits";
                  } else {
                    return null;
                  }
                },),
                const SizedBox(height: 15),
                InkWell(
                    onTap: () {
                      if (formGlobalKey.currentState!.validate()) {
                        setState(() {
                          Utils.isloading=true;
                        });
                        Future.delayed(Duration(seconds: 1), () {
                          setState(() {
                            Utils.isloading = false;
                          });
                          Utils.nevergoTo(context, Bottom_Page());                        });
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
