import 'package:flutter/material.dart';
import 'package:tour_app/utils/app_styles.dart';

SnackBar snackBar(String message, Color color,
    [int duration = 600, double fontSize = 14]){
  return SnackBar(
      backgroundColor: color,
      duration: Duration(milliseconds: duration),
      content:
      Text(message,
      style: AppStyles.appCustomTextStyle(
          Colors.white,
          FontWeight.w400,
          fontSize
      ),
      )
  );
}