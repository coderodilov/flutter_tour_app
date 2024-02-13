import 'package:flutter/material.dart';
import 'package:tour_app/screens/bottom_navigation/home_screen/model/category_data.dart';
import 'package:tour_app/utils/app_colors.dart';
import 'package:tour_app/utils/app_styles.dart';

class ItemCategory extends StatefulWidget {
  CategoryData? data;

  ItemCategory({super.key, required this.data});

  @override
  State<ItemCategory> createState() => _ItemCategoryState();
}

class _ItemCategoryState extends State<ItemCategory> {
  late CategoryData data;

  @override
  void initState() {
    data = widget.data!;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 12),
      child: Column(
        children: [
          Container(
            height: 60,
            width: 60,
            alignment: Alignment.center,
            padding: const EdgeInsets.all(12),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius:  BorderRadius.all(Radius.circular(16)),
            ),
            child: Image.asset(
              height: 40,
              width: 40,
              data.imageUrl
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 4),
            child: Text(
              data.title,
              style: AppStyles.appCustomTextStyle(
                  appBoldTextColor,
                  FontWeight.w400,
                  14
              ),),
          )
        ],
      ),
    );
  }
}
