import 'package:tour_app/screens/bottom_navigation/home_screen/model/trips_data.dart';


import '../model/all_trips_data.dart';
import '../model/category_data.dart';
import '../nav_bar/nav_item_data.dart';

List<CategoryData> listCategory = [
  CategoryData(
      imageUrl: 'assets/navigation/home/ic_spots_1.png', title: 'Spots'),
  CategoryData(
      imageUrl: 'assets/navigation/home/ic_spots_2.png', title: 'Spots'),
  CategoryData(
      imageUrl: 'assets/navigation/home/ic_events.png', title: 'Events'),
  CategoryData(
      imageUrl: 'assets/navigation/home/ic_flights.png', title: 'Flights'),
];

List<TripsData> listTrips = [
  TripsData(
      imageUrl: 'assets/navigation/home/img_trips.png',
      title: 'Sighting',
      city: 'Paris, Europe'),
  TripsData(
      imageUrl: 'assets/navigation/home/img_trips.png',
      title: 'Sighting',
      city: 'Paris, Europe'),
  TripsData(
      imageUrl: 'assets/navigation/home/img_trips.png',
      title: 'Sighting',
      city: 'Paris, Europe'),
  TripsData(
      imageUrl: 'assets/navigation/home/img_trips.png',
      title: 'Sighting',
      city: 'Paris, Europe'),
];

List<AllTripsData> allListViews = [
  AllTripsData(title: 'Popular trips', list: listTrips, itemSize: 190),
  AllTripsData(title: 'Trending', list: listTrips, itemSize: 190),
  AllTripsData(title: 'Branding', list: listTrips, itemSize: 190),
  AllTripsData(title: 'New Square', list: listTrips, itemSize: 190),

];

List<NavItemData> listNavItem = [
  NavItemData(
      iconPath: 'assets/navigation/icons/ic_home_line.png',
      selectedIconPath: 'assets/navigation/icons/ic_home_filled.png',
      title: 'Home'),
  NavItemData(
      iconPath: 'assets/navigation/icons/ic_plans_line.png',
      selectedIconPath: 'assets/navigation/icons/ic_plans_filled.png',
      title: 'Plans'),
  NavItemData(
      iconPath: 'assets/navigation/icons/ic_profile_line.png',
      selectedIconPath: 'assets/navigation/icons/ic_profile_filled.png',
      title: 'Profile'),
  NavItemData(
      iconPath: 'assets/navigation/icons/ic_connect_line.png',
      selectedIconPath: 'assets/navigation/icons/ic_connect_filled.png',
      title: 'Connects'),
];
