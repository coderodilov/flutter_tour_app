import 'package:flutter/material.dart';
import 'package:tour_app/utils/app_colors.dart';
import 'package:tour_app/utils/app_styles.dart';

class PlansScreen extends StatefulWidget {
  const PlansScreen({super.key});

  @override
  State<PlansScreen> createState() => _PlansScreenState();
}

class _PlansScreenState extends State<PlansScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.green.shade100,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Plans',
              style: AppStyles.appCustomTextStyle(
                  appRegularTextColor, FontWeight.w400, 36),
            )
          ],
        ),
      ),
    );
  }
}
