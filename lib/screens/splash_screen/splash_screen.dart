import 'package:flutter/material.dart';
import 'package:tour_app/hive/hive_details.dart';

import '../../utils/app_const.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 1500), () {
      if(userBox.isNotEmpty){
        Navigator.pushNamedAndRemoveUntil
          (context,
            AppConst.loginScreen,
                (route) => false);
      } else {
        Navigator.pushNamedAndRemoveUntil
          (context,
            AppConst.loginAndSignUpScreen,
                (route) => false);
      }
    }
    );
    super.initState();
  }

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
              width: 200,
              height: 200,
            ),
          ],
        ),
      ),
    );
  }
}
