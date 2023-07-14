import 'package:aagyodeliverypartners/colors/colors_const.dart';
import 'package:aagyodeliverypartners/styles/textstyle_const.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import '../../../const/constString.dart';
import '../controllers/auth_controller.dart';
import '../widgets/sign_signup_button_widget.dart';
import 'login_with_gmail.dart';
import 'otp_verification.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});
  static String verify = "";
  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}
class _WelcomeScreenState extends State<WelcomeScreen> {
  TextEditingController countrycode = TextEditingController();
  final AuthController authController = Get.put(AuthController());
  final AuthControllerNew authControllerNew = Get.put(AuthControllerNew());
  final TextEditingController phoneNumberController = TextEditingController();
  late String countryCode;
  late String? phoneNumber;
  var phone = "";
  late String? _textInput;
  bool _isChecked = true;
  bool _isloading=false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              const SizedBox(
                height: 72,
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  'Welcome to AAGYO !',
                  style: AppTextStyles.kHeading1TextStyle.copyWith(
                    color: AppColors.primary,
                    fontSize: 32,
                  ),
                ),
              ),
              SizedBox(
                child: Image.asset(
                  splash,height:200,width:200
                ),
              ),
              const Text(
                textAlign: TextAlign.center,
                'Login with Phone',
                style: AppTextStyles.kBody20SemiboldTextStyle,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                textAlign: TextAlign.center,
                'We will send you an One Time Password',
                style: AppTextStyles.kCaption12RegularTextStyle.copyWith(
                  color: Color.fromRGBO(100, 116, 139, 1),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  'on this mobile number',
                  style: AppTextStyles.kCaption12RegularTextStyle.copyWith(
                    color: Color.fromRGBO(100, 116, 139, 1),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Row(
                  children: [
                    const SizedBox(width: 10),
                    Expanded(
                      child: TextFormField(
                        controller: phoneNumberController,
                        keyboardType: TextInputType.phone,
                        maxLength: 10,
                        onChanged: (text) {
                          setState(() {
                            _textInput = text;
                            phone = text;
                          });
                        },
                        decoration: InputDecoration(
                          counterText: '',
                          hintText: 'Enter mobile number',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: Color.fromRGBO(203, 212, 225, 1),
                            ),
                          ),
                          prefixText: '+91 ',
                          prefixStyle: AppTextStyles.kBody15SemiboldTextStyle.copyWith(color: AppColors.white100),
                          suffixIcon: IconButton(
                            icon: const Icon(
                              Icons.cancel_rounded,
                              color: Colors.grey,
                            ),
                            onPressed: () {
                              phoneNumberController.clear();
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SignInUpButtonWidget(
                text:  !_isloading?'Get OTP':'circular',
                onpressed: () async {
                  setState(() {
                    _isloading = true;
                  });
                  final String? phone = phoneNumberController.text.trim();
                  if (phone != null && phone.isNotEmpty) {
                    phoneNumber = '+91$phone';
                    await FirebaseAuth.instance.verifyPhoneNumber(
                      phoneNumber: phoneNumber!,
                      verificationCompleted:
                          (PhoneAuthCredential credential) {},
                      verificationFailed: (FirebaseAuthException e) {},
                      codeSent: (String verificationId, int? resendToken) {
                        WelcomeScreen.verify = verificationId;
                        // print('OTP:' + verificationId);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                OtpVerification(text: _textInput!),
                          ),
                        );
                        setState(() {
                          _isloading = false;
                        });
                      },
                      codeAutoRetrievalTimeout: (String verificationId) {},
                    );
                  }
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Checkbox(
                    value: _isChecked,
                    activeColor: Colors.transparent,
                    checkColor: AppColors.primary,
                    onChanged: (bool? value) {
                      setState(() {
                        _isChecked = value ?? true;
                      });
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4.0),
                      side: const BorderSide(
                        width: 2,
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    'I agree Terms and Conditions',
                    style: AppTextStyles.kCaption12RegularTextStyle
                        .copyWith(color: Color.fromRGBO(100, 116, 139, 1)),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 1.5,
                      width: size.width * 0.25,
                      color: Color.fromRGBO(100, 116, 139, 1),
                    ),
                    Text(
                      'Or Connect With',
                      style: AppTextStyles.kSmall10RegularTextStyle
                          .copyWith(color: AppColors.neutralLight),
                    ),
                    Container(
                      height: 1.5,
                      width: size.width * 0.25,
                      color: Color.fromRGBO(100, 116, 139, 1),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const LoginWithGmail(),
            ],
          ),
        ),
      ),
    );
  }
}