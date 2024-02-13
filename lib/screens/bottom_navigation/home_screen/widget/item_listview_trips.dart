import 'package:flutter/material.dart';
import 'package:tour_app/screens/bottom_navigation/home_screen/model/all_trips_data.dart';
import 'package:tour_app/screens/bottom_navigation/home_screen/widget/item_trips.dart';
import 'package:tour_app/utils/app_colors.dart';
import 'package:tour_app/utils/app_const.dart';
import 'package:tour_app/utils/app_styles.dart';

class ItemListViewTrips extends StatefulWidget {
  AllTripsData data;

  ItemListViewTrips({
    super.key,
    required this.data,
  });

  @override
  State<ItemListViewTrips> createState() => _ItemListViewTripsState();
}

class _ItemListViewTripsState extends State<ItemListViewTrips> {
  late AllTripsData data;

  @override
  void initState() {
    data = widget.data;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Text(
              data.title,
              style: AppStyles.appCustomTextStyle(
                  appBoldTextColor, FontWeight.w500, 18),
            ),
          ),
          Container(
            height: data.itemSize,
            margin: const EdgeInsets.symmetric(vertical: 12),
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, AppConst.homeScreenDetails,
                          arguments: {'index': index, 'title': data.title});
                    },
                    child: ItemTrips(data: data.list[index])
                );
              },
              itemCount: data.list.length,
            ),
          )
        ],
      ),
    );
  }
}
