import 'package:flutter/material.dart';
import 'package:tour_app/hive/hive_controller.dart';
import 'package:tour_app/hive/hive_details.dart';
import 'package:tour_app/utils/app_const.dart';
import 'package:tour_app/utils/app_validation_checker.dart';
import 'package:tour_app/widgets/app_custom_snackbar.dart';
import 'package:tour_app/widgets/app_rounded_gradient_button.dart';
import 'package:tour_app/widgets/app_rounded_text_field_with_shadow.dart';

import '../../../utils/app_actions.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_styles.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  TextEditingController mailController = TextEditingController();

  bool isNotMail = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Forgot Password',
            style: AppStyles.appCustomTextStyle(
                appRegularTextColor,
                FontWeight.w600,
                18),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 18, horizontal: 36),
            child: Text(
              'Enter your email or mobile \n number to reset the password',
              style: AppStyles.appCustomTextStyle(
                  appRegularTextColor,
                  FontWeight.w400,
                  14
              ),
              textAlign: TextAlign.center,
            ),
          ),
          AppRoundedShadowTextFieldWithShadow(
            hintText: 'Enter Email',
            backgroundColor: Colors.white,
            errorText: isNotMail,
            controller: mailController,
            textColor: appRegularTextColor,
            paddingHorizontal: 12,
            marginHorizontal: 36,
            marginVertical: 12,
            height: 60,
            onTextChanged: (value) => {
              if(AppValidationChecker.isEmail(mailController.text) ||
              mailController.text.isEmpty){
                setState(() {
                  isNotMail = false;
                })
              } else {
                setState(() {
                  isNotMail = true;
                  })
              }
            },
          ),
          AppRoundedGradientButton(
            onClick: () => {
              AppActions.clearAllFocus(context),
              user = HiveController.getUser(),
              if(mailController.text.isNotEmpty && 
                  user.mail == mailController.text){
                  _sendOtp(mailController.text)
              } else {
                ScaffoldMessenger.of(context)
                    .showSnackBar(
                    snackBar('User not found', appPrimaryColor))
              }
            },
            text: 'SEND OTP',
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

  void _sendOtp(String mail){
    if(AppValidationChecker.isEmail(mail)){
      Navigator.pushNamed(context, AppConst.checkMailScreen);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: appPrimaryColor,
          content: Text(
              'Enter valid mail',
            style: AppStyles.appCustomTextStyle(Colors.white, FontWeight.w300, 16),
          )
      ));
    }
  }
}
