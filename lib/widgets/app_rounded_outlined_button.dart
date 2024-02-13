import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tour_app/utils/app_styles.dart';

class AppRoundedOutlinedButton extends StatefulWidget {
  Function() onClick;
  FontWeight fontWeight;
  String text;

  double borderRadius;
  double height;
  double marginHorizontal;
  double marginVertical;
  double? fontSize;
  double borderWidth;

  Color backgroundColor;
  Color borderColor;
  Color textColor;

  AppRoundedOutlinedButton({super.key,

    required this.onClick,
    required this.text,
    required this.backgroundColor,
    required this.borderColor,
    required this.borderWidth,
    required this.textColor,

    this.borderRadius = 0,
    this.height = 60,
    this.fontSize,
    this.fontWeight = FontWeight.normal,
    this.marginVertical = 0,
    this.marginHorizontal = 0,
  });

  @override
  State<AppRoundedOutlinedButton> createState() => _AppRoundedOutlinedButtonState();
}

class _AppRoundedOutlinedButtonState extends State<AppRoundedOutlinedButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onClick,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: Container(
        width: double.infinity,
        height: widget.height,
        margin:  EdgeInsets.symmetric(
            horizontal: widget.marginHorizontal,
            vertical: widget.marginVertical
        ),
        alignment: Alignment.center,
        decoration:  BoxDecoration(
            borderRadius: BorderRadius.circular(widget.borderRadius),
            border:  Border.all(
              color: widget.borderColor,
              width: widget.borderWidth,
            ),
            color: widget.backgroundColor
        ),
        child: Text(
          widget.text,
          textAlign: TextAlign.center,
          style: GoogleFonts.poppins(
            textStyle: AppStyles.appCustomTextStyle(
              widget.textColor,
              widget.fontWeight,
              widget.fontSize
            )
          )
        ),
      ),
    );
  }
}
