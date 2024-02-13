import 'package:flutter/material.dart';
import 'package:tour_app/utils/app_styles.dart';

class AppRoundedGradientButton extends StatefulWidget {
  Function() onClick;
  FontWeight? fontWeight;
  String text;

  double borderRadius;
  double height;
  double marginHorizontal;
  double marginVertical;
  double? fontSize;

  Color startColor;
  Color endColor;
  Color textColor;

  AppRoundedGradientButton({
    super.key,
    required this.onClick,
    required this.text,
    required this.startColor,
    required this.endColor,
    this.textColor = Colors.white,
    this.borderRadius = 0,
    this.marginHorizontal = 0,
    this.marginVertical = 0,
    this.height = 60,
    this.fontSize,
    this.fontWeight,
  });

  @override
  State<AppRoundedGradientButton> createState() =>
      _AppRoundedGradientButtonState();
}

class _AppRoundedGradientButtonState extends State<AppRoundedGradientButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onClick,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: Container(
        width: double.infinity,
        height: widget.height,
        margin: EdgeInsets.symmetric(
            horizontal: widget.marginHorizontal,
            vertical: widget.marginVertical),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(widget.borderRadius),
            gradient:
                LinearGradient(colors: [widget.startColor, widget.endColor])),
        child: Text(widget.text,
            textAlign: TextAlign.center,
            style: AppStyles.appCustomTextStyle(
              widget.textColor,
              widget.fontWeight,
              widget.fontSize,
            )),
      ),
    );
  }
}
