import 'package:flutter/material.dart';
import 'package:tour_app/hive/hive_controller.dart';
import 'package:tour_app/hive/hive_details.dart';
import 'package:tour_app/widgets/app_custom_snackbar.dart';

import '../../../utils/app_actions.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_const.dart';
import '../../../utils/app_styles.dart';
import '../../../utils/app_validation_checker.dart';
import '../../../widgets/app_rounded_gradient_button.dart';
import '../../../widgets/app_rounded_text_field_with_shadow.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  bool isPasswordIncorrect = false;
  bool isConfirmPasswordIncorrect = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Reset Password',
            style: AppStyles.appCustomTextStyle(
                appRegularTextColor,
                FontWeight.w600,
                18),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 36, top: 12),
            child: Text(
              'Enter your new \n password details',
              style: AppStyles.appCustomTextStyle(
                  appRegularTextColor,
                  FontWeight.w400,
                  14
              ),
              textAlign: TextAlign.center,
            ),
          ),
          AppRoundedShadowTextFieldWithShadow(
            errorText: isPasswordIncorrect,
            controller: passwordController,
            hintText: 'Password',
            backgroundColor: Colors.white,
            marginVertical: 12,
            marginHorizontal: 36,
            paddingHorizontal: 16,
            iconDataPassword: const [
              Icons.visibility_outlined,
              Icons.visibility_off_outlined
            ],
            iconColor: appTextFieldIconColor,
            onTextChanged: (value) => {
              if (AppValidationChecker.isPassword(passwordController.text) ||
                  passwordController.text.isEmpty)
                {
                  setState(() {
                    isPasswordIncorrect = false;
                  })
                } else {
                setState(() {
                  isPasswordIncorrect = true;
                })
              }
            },
          ),
          AppRoundedShadowTextFieldWithShadow(
            errorText: isConfirmPasswordIncorrect,
            controller: confirmPasswordController,
            hintText: 'Repeat Password',
            backgroundColor: Colors.white,
            marginVertical: 12,
            marginHorizontal: 36,
            paddingHorizontal: 16,
            iconDataPassword: const [
              Icons.visibility_outlined,
              Icons.visibility_off_outlined
            ],
            iconColor: appTextFieldIconColor,
            onTextChanged: (value) => {
              if (confirmPasswordController.text.isEmpty ||
                  confirmPasswordController.text == passwordController.text)
                {
                  setState(() {
                    isConfirmPasswordIncorrect = false;
                  })
                } else {
                setState(() {
                  isConfirmPasswordIncorrect = true;
                })
              }
            },
          ),
          AppRoundedGradientButton(
            onClick: () => _resetPassword(),
            text: 'RESET',
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


  void _resetPassword(){
    AppActions.clearAllFocus(context);
    if(!isPasswordIncorrect && !isConfirmPasswordIncorrect &&
        passwordController.text.isNotEmpty &&
        confirmPasswordController.text.isNotEmpty &&
        AppValidationChecker.isPassword(passwordController.text))
    {

      user = HiveController.getUser();
      user.password = passwordController.text;
      user.save();

      Navigator.pushNamedAndRemoveUntil(context,
          AppConst.passwordRestoredSuccessfulScreen, (route) => false);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(snackBar(
          'Enter valid password',
           appPrimaryColor,
      ));
    }

  }
}
