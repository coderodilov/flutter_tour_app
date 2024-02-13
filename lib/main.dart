
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:tour_app/hive/hive_details.dart';
import 'package:tour_app/models/user.dart';
import 'package:tour_app/screens/authorization/forgot_password/check_email_screen.dart';
import 'package:tour_app/screens/authorization/forgot_password/forgot_password_screen.dart';
import 'package:tour_app/screens/authorization/forgot_password/otp_verification_screen.dart';
import 'package:tour_app/screens/authorization/forgot_password/password_restored_succesfully_screen.dart';
import 'package:tour_app/screens/authorization/forgot_password/reset_password_screen.dart';
import 'package:tour_app/screens/authorization/login/login_screen.dart';
import 'package:tour_app/screens/authorization/login_sign_up_screen.dart';
import 'package:tour_app/screens/authorization/signup/sign_up_screen.dart';
import 'package:tour_app/screens/bottom_navigation/home.dart';
import 'package:tour_app/screens/bottom_navigation/home_screen/home_screen_details.dart';
import 'package:tour_app/screens/splash_screen/splash_screen.dart';
import 'package:tour_app/utils/app_const.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(UserAdapter());
  userBox = await Hive.openBox('myBox');

  runApp(const TourApp());
}

class TourApp extends StatelessWidget {
  const TourApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: false,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: AppConst.splashScreen,
      routes: {
        AppConst.splashScreen:
            (context) => const SplashScreen(),
        AppConst.loginAndSignUpScreen:
            (context) => const LoginSignUpScreen(),
        AppConst.loginScreen:
            (context) => const LoginScreen(),
        AppConst.signUpScreen:
            (context) => const SignUpScreen(),
        AppConst.forgotPasswordScreen:
            (context) => const ForgotPasswordScreen(),
        AppConst.otpVerifyingScreen:
            (context) => const OtpVerifyingScreen(),
        AppConst.checkMailScreen:
            (context) => const CheckMailScreen(),
        AppConst.resetPasswordScreen:
            (context) => const ResetPasswordScreen(),
        AppConst.passwordRestoredSuccessfulScreen:
            (context) => const PasswordRestoredSuccessfulScreen(),
        AppConst.homeScreen:
            (context) => const Home(),
        AppConst.homeScreenDetails:
            (context) => const HomeScreenDetails(),

      },
    );
  }
}


