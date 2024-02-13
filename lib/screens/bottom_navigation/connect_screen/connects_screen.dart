import 'package:flutter/material.dart';
import 'package:tour_app/utils/app_colors.dart';
import 'package:tour_app/utils/app_styles.dart';

class ConnectsScreen extends StatefulWidget {
  const ConnectsScreen({super.key});

  @override
  State<ConnectsScreen> createState() => _ConnectsScreenState();
}

class _ConnectsScreenState extends State<ConnectsScreen> {
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
              'Connects',
              style: AppStyles.appCustomTextStyle(
                  appRegularTextColor, FontWeight.w400, 36),
            )
          ],
        ),
      ),
    );
  }
}
