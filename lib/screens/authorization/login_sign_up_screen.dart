import 'package:flutter/material.dart';
import 'package:tour_app/utils/app_styles.dart';
import 'package:tour_app/widgets/app_rounded_gradient_button.dart';
import 'package:tour_app/widgets/app_rounded_outlined_button.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_const.dart';

class LoginSignUpScreen extends StatefulWidget {
  const LoginSignUpScreen({super.key});

  @override
  State<LoginSignUpScreen> createState() => _LoginSignUpScreenState();
}

class _LoginSignUpScreenState extends State<LoginSignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            Container(
              margin: const EdgeInsets.only(bottom: 36),
              child:  Text(
                'Sign In to the application \nto enjoy!',
                textAlign: TextAlign.center,
                style: AppStyles.appCustomTextStyle(
                    appRegularTextColor,
                    FontWeight.w400)
              ),
            ),
            AppRoundedGradientButton(
              onClick: () =>
                  {Navigator.pushNamed(context, AppConst.loginScreen)},
              text: 'LOGIN',
              startColor: btnGradientStartColor,
              endColor: btnGradientEndColor,
              borderRadius: 16,
              marginHorizontal: 36,
              marginVertical: 12,
              fontSize: 16,
            ),
            AppRoundedOutlinedButton(
              onClick: () =>
                  {Navigator.pushNamed(context, AppConst.signUpScreen)},
              text: 'SIGN UP',
              borderWidth: 2,
              backgroundColor: Colors.white,
              borderColor: btnOutlinedBorderColor,
              textColor: btnOutlinedTextColor,
              borderRadius: 16,
              marginVertical: 12,
              fontSize: 16,
              marginHorizontal: 36,
            )
          ],
        ),
      ),
    );
  }
}
