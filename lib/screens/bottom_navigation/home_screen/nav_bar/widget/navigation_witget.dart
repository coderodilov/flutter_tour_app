import 'package:flutter/material.dart';
import 'package:tour_app/screens/bottom_navigation/home_screen/nav_bar/widget/navigation_item.dart';
import 'package:tour_app/utils/app_colors.dart';

import '../nav_item_data.dart';

class NavigationWidget extends StatefulWidget {
  List<NavItemData> listItemData;
  int selectedItem;
  Function(int index) onClick;

  NavigationWidget({
    super.key,
    required this.listItemData,
    required this.selectedItem,
    required this.onClick
  });

  @override
  State<NavigationWidget> createState() => _NavigationWidgetState();
}

class _NavigationWidgetState extends State<NavigationWidget> {
  late List<NavItemData> list;

  @override
  void initState() {
    list = widget.listItemData;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () => widget.onClick(index),
          child: NavigationItem(
            iconPath: index == widget.selectedItem ?
            list[index].selectedIconPath : list[index].iconPath,
            title: list[index].title,
            color: index == widget.selectedItem ?
            navBarSelectedTextColor : navBarTextColor,
          ),
        );
      },
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemCount: list.length,
      physics: const BouncingScrollPhysics(),
    );
  }

}
