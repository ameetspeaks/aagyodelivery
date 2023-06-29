import 'package:aagyodeliverypartners/colors/colors_const.dart';
import 'package:aagyodeliverypartners/const/constString.dart';
import 'package:aagyodeliverypartners/styles/textstyle_const.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../bottomnavbar.dart';

class LoginWithGmail extends StatefulWidget {
  const LoginWithGmail({Key? key}) : super(key: key);

  @override
  State<LoginWithGmail> createState() => _LoginWithGmailState();
}

class _LoginWithGmailState extends State<LoginWithGmail> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: 44,
      width: size.width * 0.85,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            elevation: 1,
            backgroundColor: AppColors.white,
          ),
          onPressed: () async {
            // Sign in with Google and get the user credential
            final UserCredential userCredential = await _signInWithGoogle();
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Bottom_Page()));
            // Access user data
            final User? user = userCredential.user;
            final String? gmail = user?.email;
            final String? name = user?.displayName;
            setState(() {
            _isLoading = true;
            });
          },
          child: Center(
            child: !_isLoading?Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(google,height: 35,width: 35,),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  'Google',
                  style: AppTextStyles.kBody15RegularTextStyle
                      .copyWith(color: AppColors.neutralLight),
                )
              ],
            ):CircularProgressIndicator(color: AppColors.primary,),
          )),
    );
  }

  bool _isLoading = false;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<UserCredential> _signInWithGoogle() async {
    setState(() {
      _isLoading = true; // Start the loading state
    });
    // Trigger the Google authentication flow
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential with the token
    final OAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Sign in to Firebase with the Google credential
    final UserCredential userCredential =
        await _auth.signInWithCredential(credential);
    setState(() {
      _isLoading = false; // End the loading state
    });
    return userCredential;
  }
}