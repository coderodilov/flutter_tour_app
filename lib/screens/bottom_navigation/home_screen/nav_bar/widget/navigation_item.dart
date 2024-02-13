import 'package:flutter/material.dart';
import 'package:tour_app/utils/app_colors.dart';
import 'package:tour_app/utils/app_styles.dart';

class NavigationItem extends StatefulWidget {
  String iconPath;
  String title;
  Color color;

  NavigationItem({
    super.key,
    required this.iconPath,
    required this.title,
    required this.color
  });

  @override
  State<NavigationItem> createState() => _NavigationItemState();
}

class _NavigationItemState extends State<NavigationItem> {

  @override
  Widget build(BuildContext context) {
    return SizedBox(
    height: 80,
    width: 80,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(widget.iconPath, width: 30, height: 30,),
        Text(
          widget.title,
          style: AppStyles.appCustomTextStyle(
              widget.color, FontWeight.w400, 14),)
      ],
    ),
          );
  }
}
