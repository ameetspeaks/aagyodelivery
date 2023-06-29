import 'package:aagyodeliverypartners/bottom_sheet.dart';
import 'package:aagyodeliverypartners/const/constString.dart';
import 'package:aagyodeliverypartners/landing_page/auth/controllers/auth_controller.dart';
import 'package:aagyodeliverypartners/landing_page/auth/views/welcomeScreen.dart';
import 'package:aagyodeliverypartners/styles/textstyle_const.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'colors/colors_const.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  Get.put(AuthControllerNew());
  Get.put(AuthController());
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => WelcomeScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 140,),
          Text(
            'AAGYO Delivery Partner!',
            style: AppTextStyles.kHeading1TextStyle.copyWith(
              color: AppColors.primary700,
              fontSize: 32,
            ),
          ),
          Text(
            'Deliver sab kuch Apke DOOR tak !',
            style: AppTextStyles.kHeading3TextStyle.copyWith(
              color: AppColors.primary900,
              // fontSize: 32,
            ),
          ),
          Image.asset(splash,),
        ],
      ),
    );
  }
}
