import 'package:flutter/material.dart';
import 'package:tour_app/screens/bottom_navigation/home_screen/model/trips_data.dart';
import 'package:tour_app/utils/app_colors.dart';
import 'package:tour_app/utils/app_styles.dart';

class ItemTrips extends StatefulWidget {
  TripsData? data;

  ItemTrips({super.key, required this.data});

  @override
  State<ItemTrips> createState() => _ItemTripsState();
}

class _ItemTripsState extends State<ItemTrips> {
  late TripsData data;

  @override
  void initState() {
    data = widget.data!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(right: 8, left: 8),
        padding: const EdgeInsets.all(8),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(bottom: 8),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
              child: Image.asset(
                  height: 120,
                  width: 110,
                  fit: BoxFit.fill,
                  data.imageUrl),
            ),

            Container(
              margin: const EdgeInsets.only(left: 4),
              child: Text(data.title,
                textAlign: TextAlign.start,
                style: AppStyles.appCustomTextStyle(
                    appBoldTextColor, FontWeight.w500, 14),
              ),
            ),
            Row(
              children: [
                Icon(
                    size: 16,
                    Icons.location_on_outlined, color: appRegularTextColor
                ),
                Text(data.city,
                  style: AppStyles.appCustomTextStyle(appRegularTextColor, FontWeight.w300, 13),),
              ],
            )

          ],
        ));
  }
}
