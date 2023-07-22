import 'package:aagyodeliverypartners/landing_page/auth/widgets/const_pinput.dart';
import 'package:aagyodeliverypartners/landing_page/auth/widgets/const_text_field.dart';
import 'package:flutter/material.dart';
import '../../../colors/colors_const.dart';
import '../../../const/constString.dart';
import '../../../styles/textstyle_const.dart';
import '../../../utils/Utils.dart';
import '../widgets/const_button.dart';
import 'login_screen.dart';

class GengeratePin extends StatefulWidget {
  const GengeratePin({Key? key}) : super(key: key);

  @override
  State<GengeratePin> createState() => _GengeratePinState();
}

class _GengeratePinState extends State<GengeratePin> {
  bool pin=true;
  bool repin=true;
  @override
  Widget build(BuildContext context) {

    final formGlobalKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        centerTitle: true,
        title: Text(
          "Generate Pin",
          style: AppTextStyles.kBody15SemiboldTextStyle
              .copyWith(color: AppColors.white),
        ),
      ),
      body:  Container(
        decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(background),fit: BoxFit.cover)
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: formGlobalKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Generate Your Pin",
                  style: AppTextStyles.kHeading3TextStyle
                      .copyWith(color: AppColors.white70),
                ),
                SizedBox(height: 20,),
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
                  obsure: pin,
                  totallength: 6,  validator: (number) {
                  if (number!.isEmpty || number.length<6 ) {
                    return "Pin must contain 6 digits";
                  } else {
                    return null;
                  }
                },),
                SizedBox(height: 10,),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Retype Your PIN",
                    style: AppTextStyles.kBody15SemiboldTextStyle
                        .copyWith(color: AppColors.white100),
                  ),
                ),
                SizedBox(height: 5,),
                ConstPinPut(
                  obsure: repin,
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
                      repin = !repin;
                    });
                  },
                  child: Container(
                    height: 20,
                    width: 180,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          !repin ? Icons.visibility : Icons.visibility_off,
                          color: Colors.grey,
                        ),
                        SizedBox(width: 8),
                        Text(
                          !repin ?"Hide Password":'Show Password',
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
                  height: 20,
                ),
                Center(
                  child: InkWell(
                      onTap: (){
                        if(formGlobalKey.currentState!.validate()){
                          Utils.goTo(context, LoginPage());
                          Utils.PopUP(context, "You have registered successfully\nPlease wait Admin will verify your  data then you will be able to login");
                        }
                      },
                      child: ConstButton(text: "Submit",)),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
