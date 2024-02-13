import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:tour_app/hive/hive_details.dart';
import 'package:tour_app/utils/app_const.dart';
import 'package:tour_app/hive/hive_controller.dart';
import 'package:tour_app/utils/app_styles.dart';
import 'package:tour_app/utils/app_validation_checker.dart';
import 'package:tour_app/widgets/app_rounded_gradient_button.dart';
import 'package:tour_app/widgets/app_rounded_text_field_with_shadow.dart';

import '../../../models/user.dart';
import '../../../utils/app_colors.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController mailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  bool isPasswordIncorrect = false;
  bool isConfirmPasswordIncorrect = false;
  bool isNotMail = false;
  bool isNotUserName = false;
  bool isNotPhone = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 60,
                margin: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset(
                      'assets/common/ic_btn_back.png',
                      width: 30,
                      height: 30,
                    ),
                    Expanded(
                      child: Container(
                        alignment: Alignment.center,
                        child: const Text(
                          'Create Account',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                              color: Color(0xFF302A4E)),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 30,
                      height: 30,
                    ),
                  ],
                ),
              ),
              AppRoundedShadowTextFieldWithShadow(
                controller: usernameController,
                hintText: 'Username',
                errorText: isNotUserName,
                backgroundColor: Colors.white,
                marginVertical: 12,
                marginHorizontal: 36,
                paddingHorizontal: 16,
                onTextChanged: (value) => {
                  if (AppValidationChecker.isUsername(usernameController.text)  ||
                      usernameController.text.isEmpty)
                    {
                      setState(() {
                        isNotUserName = false;
                      })
                    }
                  else {
                    setState(() {
                      isNotUserName = true;
                    })
                  }
                },
              ),
              AppRoundedShadowTextFieldWithShadow(
                controller: mailController,
                hintText: 'Email',
                errorText: isNotMail,
                backgroundColor: Colors.white,
                marginVertical: 12,
                marginHorizontal: 36,
                paddingHorizontal: 16,
                onTextChanged: (value) => {
                  if (AppValidationChecker.isEmail(mailController.text)
                      || mailController.text.isEmpty) {
                  setState(() {isNotMail = false;})
                  } else {
                    setState(()
                    {
                      isNotMail = true;
                    })
                }
                },
              ),
              AppRoundedShadowTextFieldWithShadow(
                controller: phoneController,
                hintText: 'Phone',
                textInputType: TextInputType.phone,
                errorText: isNotPhone,
                backgroundColor: Colors.white,
                marginVertical: 12,
                marginHorizontal: 36,
                paddingHorizontal: 16,
                onTextChanged: (value) => {
                  if (AppValidationChecker.isPhone(phoneController.text) ||
                      phoneController.text.isEmpty)
                  {
                      setState(() {
                        isNotPhone = false;
                      })
                  } else {
                    setState(() {
                      isNotPhone = true;
                    })
                  }
                },
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
              Container(
                margin: const EdgeInsets.symmetric(vertical: 18),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: 'By continuing, you agree to our ',
                    style: AppStyles.appCustomTextStyle(
                        appRegularTextColor, FontWeight.w300),
                    children: [
                      TextSpan(
                        text: 'Terms of \n Service',
                        recognizer: TapGestureRecognizer()..onTap = () {},
                        style: AppStyles.appCustomTextStyle(
                            Colors.blue, FontWeight.w300),
                      ),
                      TextSpan(
                          text: ' and ',
                          style: AppStyles.appCustomTextStyle(
                              appRegularTextColor, FontWeight.w300)),
                      TextSpan(
                          text: 'Privacy policy',
                          style: AppStyles.appCustomTextStyle(
                              Colors.blue, FontWeight.w300)),
                    ],
                  ),
                ),
              ),
              AppRoundedGradientButton(
                onClick: () => _onClickSignUp(),
                text: 'SIGN UP',
                startColor: btnGradientStartColor,
                endColor: btnGradientEndColor,
                borderRadius: 16,
                marginVertical: 12,
                marginHorizontal: 36,
                fontSize: 16,
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 18),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: 'Already have an account? ',
                    style: AppStyles.appCustomTextStyle(
                        appRegularTextColor, FontWeight.w300),
                    children: <TextSpan>[
                      TextSpan(
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => Navigator.pushNamedAndRemoveUntil(
                              context, AppConst.loginScreen, (route) => false),

                        text: 'Login',
                        style: AppStyles.appCustomTextStyle(
                            Colors.blue, FontWeight.w300),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onClickSignUp() {
    if(!isNotUserName &&
       !isNotMail && !isNotPhone &&
       !isPasswordIncorrect && !isConfirmPasswordIncorrect &&
    usernameController.text.isNotEmpty &&
    mailController.text.isNotEmpty &&
    phoneController.text.isNotEmpty &&
    phoneController.text.isNotEmpty &&
    passwordController.text.isNotEmpty &&
    confirmPasswordController.text.isNotEmpty
    ) {

      if(userBox.isEmpty){
        HiveController.createAndSaveUser(
            usernameController.text,
            mailController.text,
            phoneController.text,
            passwordController.text);
      } else {
        HiveController.updateUserDetails(
            usernameController.text,
            mailController.text,
            phoneController.text,
            passwordController.text);
      }

      Navigator.pushNamedAndRemoveUntil(
          context, AppConst.loginScreen, (route) => false);

    } else {
     setState(() {
       isNotUserName = true;
       isNotMail = true;
       isNotPhone = true;
       isPasswordIncorrect = true;
       isConfirmPasswordIncorrect = true;
     });
    }
  }

}
