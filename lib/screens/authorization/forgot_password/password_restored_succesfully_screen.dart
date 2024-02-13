import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../utils/app_colors.dart';
import '../../../utils/app_const.dart';
import '../../../utils/app_styles.dart';
import '../../../widgets/app_rounded_gradient_button.dart';

class PasswordRestoredSuccessfulScreen extends StatefulWidget {
  const PasswordRestoredSuccessfulScreen({super.key});

  @override
  State<PasswordRestoredSuccessfulScreen> createState() => _PasswordRestoredSuccessfulScreenState();
}

class _PasswordRestoredSuccessfulScreenState extends State<PasswordRestoredSuccessfulScreen> {
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
                    'Successful!',
                    style: AppStyles.appCustomTextStyle(
                        appRegularTextColor, FontWeight.w600, 18),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 16),
                    child: Image.asset(
                        height: 150, width: 150, 'assets/auth/ic_okay.png'),
                  ),
                  Text(
                    'Resetting password was \n successful',
                    style: AppStyles.appCustomTextStyle(
                        appRegularTextColor, FontWeight.w400, 14),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            AppRoundedGradientButton(
              onClick: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, AppConst.loginScreen, (route) => false);
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
    );;
  }
}
