import 'package:flutter/material.dart';
import 'package:tour_app/utils/app_colors.dart';
import 'package:tour_app/utils/app_styles.dart';

class HomeScreenDetails extends StatefulWidget {
  const HomeScreenDetails({super.key});

  @override
  State<HomeScreenDetails> createState() => _HomeScreenDetailsState();
}

class _HomeScreenDetailsState extends State<HomeScreenDetails> {

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> arguments =
    ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    var index = arguments['index'];
    var title = arguments['title'];

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.center,
            child: Text("$title \n ${index.toString()}",
              textAlign: TextAlign.center,
              style: AppStyles.appCustomTextStyle(
                  appBoldTextColor, FontWeight.w500, 36),),
          )
        ],
      ),
    );
  }
}
