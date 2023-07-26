import 'dart:async';
import 'package:aagyodeliverypartners/colors/colors_const.dart';
import 'package:aagyodeliverypartners/styles/textstyle_const.dart';
import 'package:flutter/material.dart';


class CircularTimer extends StatefulWidget {
  @override
  State<CircularTimer> createState() => _CircularTimerState();
}

class _CircularTimerState extends State<CircularTimer> {
  late Timer _timer;
  int _seconds = 60;
  int _elapsedSeconds = 0;

  @override
  void initState() {
    super.initState();
    // Start the timer when the screen is loaded
    _startTimer();
  }

  void _startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = Timer.periodic(oneSec, (Timer timer) {
      setState(() {
        if (_elapsedSeconds < _seconds) {
          _elapsedSeconds++;
        } else {
          _timer.cancel();
        }
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double progress = _elapsedSeconds / _seconds;
    return Stack(
      children: [
        // Circular border
        SizedBox(
          height: 200,
          width: 200,
          child: CircularProgressIndicator(
            strokeWidth: 10,
            value: 1.0,
            backgroundColor: Colors.grey,
            valueColor: AlwaysStoppedAnimation<Color>(AppColors.white40),
          ),
        ),
        // Progress indicator
        SizedBox(
          height: 200,
          width: 200,
          child: CircularProgressIndicator(
            value: progress,
            strokeWidth: 5,
            backgroundColor: Colors.transparent,
            valueColor: AlwaysStoppedAnimation<Color>(AppColors.primary),
          ),
        ),
        // Timer text
        Positioned(
          left: size.width*.22,
          top: size.height*.1,
          child: Text(
            '${_seconds - _elapsedSeconds} s',
            style:AppTextStyles.kHeading1TextStyle.copyWith(color: AppColors.primary),
          ),
        ),
      ],
    );
  }
}
