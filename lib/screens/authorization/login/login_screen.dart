import 'package:flutter/material.dart';
import 'package:tour_app/hive/hive_details.dart';
import 'package:tour_app/utils/app_actions.dart';
import 'package:tour_app/utils/app_const.dart';
import 'package:tour_app/hive/hive_controller.dart';
import 'package:tour_app/utils/app_styles.dart';
import 'package:tour_app/widgets/app_rounded_gradient_button.dart';
import 'package:tour_app/widgets/app_rounded_text_field_with_shadow.dart';

import '../../../utils/app_colors.dart';
import '../../../widgets/app_custom_snackbar.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    if(userBox.isNotEmpty){
      user = HiveController.getUser();
      usernameController.text = user.username!;
      passwordController.text = user.password!;
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/splash/ic_bird.png',
              width: 150,
              height: 150,
            ),
            AppRoundedShadowTextFieldWithShadow(
              controller: usernameController,
              hintText: 'Enter Username',
              backgroundColor: Colors.white,
              marginHorizontal: 36,
              marginVertical: 12,
              paddingHorizontal: 18,
            ),
            AppRoundedShadowTextFieldWithShadow(
              controller: passwordController,
              hintText: 'Password',
              backgroundColor: Colors.white,
              marginHorizontal: 36,
              marginVertical: 12,
              paddingHorizontal: 18,
              iconDataPassword: const [
                Icons.visibility_outlined,
                Icons.visibility_off_outlined
              ],
              iconColor: appTextFieldIconColor,
            ),
            Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 42, vertical: 12),
                alignment: Alignment.bottomRight,
                child: InkWell(
                  onTap: () => {
                    AppActions.clearAllFocus(context),
                    Navigator.pushNamed(context, AppConst.forgotPasswordScreen)
                  },
                  child: Text('Forgot Password',
                      style: AppStyles.appCustomTextStyle(
                        appRegularTextColor,
                        FontWeight.w400,
                      )),
                )),
            AppRoundedGradientButton(
              onClick: () {
                AppActions.clearAllFocus(context);
                if(userBox.isEmpty){
                  ScaffoldMessenger.of(context).showSnackBar(
                      snackBar('You have not registered yet', appPrimaryColor, 1200));
                }
                if(usernameController.text.isEmpty ||
                    passwordController.text.isEmpty){
                  ScaffoldMessenger.of(context).showSnackBar(
                      snackBar('Enter user details', appPrimaryColor, 1200));
                }
                if (usernameController.text == user.username! &&
                    passwordController.text == user.password! &&
                    usernameController.text.isNotEmpty &&
                    passwordController.text.isNotEmpty) {
                  Navigator.pushNamed(context, AppConst.homeScreen);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                      snackBar('User not found', appPrimaryColor, 1200));
                }
              },
              text: 'LOGIN',
              startColor: btnGradientStartColor,
              endColor: btnGradientEndColor,
              borderRadius: 16,
              marginHorizontal: 36,
              marginVertical: 12,
              fontSize: 16,
            ),
            SizedBox(
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Or continue with',
                      style: AppStyles.appCustomTextStyle(
                          appRegularTextColor, FontWeight.w300))
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/auth/ic_google.png',
                  width: 80,
                  height: 80,
                ),
                Image.asset(
                  'assets/auth/ic_twitter.png',
                  width: 80,
                  height: 80,
                ),
                Image.asset(
                  'assets/auth/ic_facebook.png',
                  width: 80,
                  height: 80,
                )
              ],
            ),
            SizedBox(
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Not a member? ',
                      style: AppStyles.appCustomTextStyle(
                          appRegularTextColor, FontWeight.w300)),
                  InkWell(
                    onTap: () =>
                        {
                          AppActions.clearAllFocus(context),
                          Navigator.pushNamed(context, AppConst.signUpScreen)
                        },
                    child: Text('Register Now',
                        style: AppStyles.appCustomTextStyle(
                            Colors.blue, FontWeight.w300)),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
