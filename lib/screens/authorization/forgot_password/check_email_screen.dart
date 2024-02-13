import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tour_app/utils/app_colors.dart';
import 'package:tour_app/utils/app_const.dart';
import 'package:tour_app/widgets/app_rounded_gradient_button.dart';

import '../../../utils/app_styles.dart';

class CheckMailScreen extends StatefulWidget {
  const CheckMailScreen({super.key});

  @override
  State<CheckMailScreen> createState() => _CheckMailScreenState();
}

class _CheckMailScreenState extends State<CheckMailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'OTP Verification',
                    style: AppStyles.appCustomTextStyle(
                        appRegularTextColor, FontWeight.w600, 18),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 16),
                    child: Image.asset(
                        height: 150, width: 150, 'assets/auth/ic_okay.png'),
                  ),
                  Text(
                    'Check your Email \n For the OTP',
                    style: AppStyles.appCustomTextStyle(
                        appRegularTextColor, FontWeight.w400, 14),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            AppRoundedGradientButton(
              onClick: () {
                Navigator.pushNamed(context, AppConst.otpVerifyingScreen, 
                arguments: {'otp': _getRandomOtp()});
              },
              text: 'OKAY',
              startColor: btnGradientStartColor,
              endColor: btnGradientEndColor,
              borderRadius: 16,
              marginHorizontal: 36,
              marginVertical: 18,
            )
          ],
        ),
      ),
    );
  }

  int _getRandomOtp(){
    int otp = 0;
    while(otp < 1000){
      otp = Random().nextInt(9999);
    }
    return otp;
  }

}
