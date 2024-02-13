import 'package:flutter/material.dart';
import 'package:tour_app/screens/bottom_navigation/home_screen/widget/item_category.dart';
import 'package:tour_app/screens/bottom_navigation/home_screen/widget/item_listview_trips.dart';

import '../../../utils/app_colors.dart';
import '../../../utils/app_styles.dart';
import '../../../widgets/app_rounded_text_field_with_shadow.dart';
import 'data/home_data.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.white,
                  Color(0xffaecdde),
                ]
            )
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 42, left: 24, right: 24),

              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(text: TextSpan(
                      children: [
                        TextSpan(text: 'Where do \n',
                            style: AppStyles.appCustomTextStyle(
                                appRegularTextColor, FontWeight.w400, 24)
                        ),
                        TextSpan(text: 'You want to go?',
                            style: AppStyles.appCustomTextStyle(
                                appRegularTextColor, FontWeight.w500, 28)
                        ),
                      ]
                  )),

                  Image.asset(
                      height: 60,
                      width: 60,
                      'assets/navigation/home/ic_person.png')
                ],
              ),
            ),
            AppRoundedShadowTextFieldWithShadow(
              hintText: 'Discover a Culture',
              backgroundColor: Colors.white,
              controller: searchController,
              marginHorizontal: 24,
              marginVertical: 16,
              paddingHorizontal: 8,
              prefixIcon: Icons.search,
              iconColor: const Color(0xFFCCC8E1),
            ),
            Expanded(
              child: ListView(
                physics: const BouncingScrollPhysics(),
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 26, vertical: 12),
                    child: Text(
                      'Categories',
                      style: AppStyles.appCustomTextStyle(
                          appBoldTextColor,
                          FontWeight.w500, 18),
                    ),
                  ),

                  Container(
                    height: 100,
                    margin: const EdgeInsets.symmetric(horizontal: 24),
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return ItemCategory(data: listCategory[index],);
                      },
                      itemCount: listCategory.length,
                    ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        height: double.maxFinite,
                        child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            return ItemListViewTrips(data: allListViews[index],);
                          },
                          itemCount: allListViews.length,
                        ),
                      ),
                    ],
                  ),
                ],

              ),
            ),

          ],
        ),
      ),
    );
  }
}
