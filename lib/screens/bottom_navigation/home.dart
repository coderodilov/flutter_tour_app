import 'package:flutter/material.dart';
import 'package:tour_app/screens/bottom_navigation/connect_screen/connects_screen.dart';
import 'package:tour_app/screens/bottom_navigation/home_screen/data/home_data.dart';
import 'package:tour_app/screens/bottom_navigation/home_screen/home_screen.dart';
import 'package:tour_app/screens/bottom_navigation/home_screen/nav_bar/widget/navigation_witget.dart';
import 'package:tour_app/screens/bottom_navigation/plans_screen/plans_screen.dart';
import 'package:tour_app/screens/bottom_navigation/profile_screen/profile_screen.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List<Widget> listNavPages = [
    const HomeScreen(),
    const PlansScreen(),
    const ProfileScreen(),
    const ConnectsScreen()
  ];

  int selectedItem = 0;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            listNavPages[selectedItem],
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                  height: 80,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.all(Radius.circular(24)),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 3,
                          blurRadius: 3,
                          offset: const Offset(2, 2)
                      ),
                    ],
                  ),
                    child:
                    NavigationWidget(
                        listItemData: listNavItem,
                        onClick: (index) {
                          setState(() {
                            selectedItem = index;
                          });
                        }, selectedItem: selectedItem,
                    )
                ),
              ],
            ),
          ],
        ),
      )
    );
  }

}
