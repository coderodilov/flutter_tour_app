import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:tour_app/utils/app_styles.dart';

import '../../../utils/app_colors.dart';
import '../../../utils/app_const.dart';
import '../../../widgets/app_rounded_gradient_button.dart';

class OtpVerifyingScreen extends StatefulWidget {
  const OtpVerifyingScreen({super.key});

  @override
  State<OtpVerifyingScreen> createState() => _OtpVerifyingScreenState();
}

class _OtpVerifyingScreenState extends State<OtpVerifyingScreen> {

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> arguments =
    ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    TextEditingController otpController = TextEditingController();
    int otp = arguments['otp'];

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('OTP Verification \n $otp',
              textAlign: TextAlign.center,
              style: AppStyles.appCustomTextStyle(
                  appRegularTextColor,
                  FontWeight.w600,
                  18),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 18, horizontal: 36),
            child: Text(
              'We will send you one time password \n this email address.',
              style: AppStyles.appCustomTextStyle(appRegularTextColor, FontWeight.w400, 14),
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 18),
            child: Pinput(
              controller: otpController,
              defaultPinTheme: PinTheme(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(12)),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(0.05),
                            spreadRadius: 3,
                            blurRadius: 3,
                            offset: const Offset(0, 0))
                      ]),
                  textStyle: AppStyles.appCustomTextStyle(
                      appRegularTextColor, FontWeight.w400, 16)),
            ),
          ),
          AppRoundedGradientButton(
            onClick: () {
              if(otp.toString() == otpController.text){
                Navigator.pushNamed(context, AppConst.resetPasswordScreen);
              } else {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    backgroundColor: appPrimaryColor,
                    content: Text(
                      'OTP is incorrect',
                      style: AppStyles.appCustomTextStyle(Colors.white, FontWeight.w300, 16),
                    )
                ));
              }
            },
            text: 'SUBMIT',
            startColor: btnGradientStartColor,
            endColor: btnGradientEndColor,
            borderRadius: 16,
            fontSize: 16,
            marginHorizontal: 36,
            marginVertical: 12,
          )
        ],
      ),
    );
  }

}
