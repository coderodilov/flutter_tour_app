import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppRoundedShadowTextFieldWithShadow extends StatefulWidget {
  TextEditingController controller;
  Function(String)? onTextChanged;
  String hintText;
  bool errorText;
  double height;
  FontWeight fontWeight;
  List<IconData>? iconDataPassword;
  IconData? suffixIcon;
  IconData? prefixIcon;
  TextInputType textInputType;

  double paddingHorizontal;
  double paddingVertical;
  double marginHorizontal;
  double marginVertical;
  double? fontSize;

  Color backgroundColor;
  Color? textColor;
  Color? hintTextColor;
  Color? iconColor;

  AppRoundedShadowTextFieldWithShadow({super.key,
    required this.hintText,
    required this.backgroundColor,
    required this.controller,
    this.onTextChanged,
    this.errorText = false,
    this.height = 60,
    this.paddingHorizontal = 0,
    this.paddingVertical = 0,
    this.marginHorizontal = 0,
    this.marginVertical = 0,
    this.fontSize = 16,
    this.fontWeight = FontWeight.normal,
    this.textColor,
    this.hintTextColor,
    this.iconDataPassword,
    this.prefixIcon,
    this.suffixIcon,
    this.iconColor,
    this.textInputType = TextInputType.text,
  }
  );

  @override
  State<AppRoundedShadowTextFieldWithShadow> createState() => _AppRoundedShadowTextFieldWithShadowState();
}

class _AppRoundedShadowTextFieldWithShadowState extends State<AppRoundedShadowTextFieldWithShadow> {
  bool isHide = true;

  @override
  void initState() {
    isHide = widget.iconDataPassword == null ? false : true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      padding:  EdgeInsets.symmetric(
          horizontal: widget.paddingHorizontal,
          vertical: widget.paddingVertical
      ),
      margin:  EdgeInsets.symmetric(
          horizontal: widget.marginHorizontal,
          vertical: widget.marginVertical
      ),
      alignment: Alignment.center,
      decoration:  BoxDecoration(
        color: widget.backgroundColor,
        border: Border.all(color: widget.errorText == false ?
        Colors.transparent : Colors.red),
        borderRadius: const BorderRadius.all(
            Radius.circular(16)
        ),
        boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 3,
              blurRadius: 3,
              offset: const Offset(0, 0)
          ),
        ],
      ),
      child:  TextField(
        maxLines: 1,
        keyboardType: widget.textInputType,
        onChanged: widget.onTextChanged,
        controller: widget.controller,
        obscureText: isHide,
        style: GoogleFonts.poppins(
          textStyle: TextStyle(
            color: widget.textColor,
            fontSize: widget.fontSize,
            fontWeight: widget.fontWeight,
          ),
        ),
        decoration: InputDecoration(
            prefixIcon: widget.prefixIcon == null ? null : Icon(
                widget.prefixIcon),
            suffixIcon: widget.iconDataPassword == null ? Icon(
                widget.suffixIcon) :
                InkWell(
                  onTap: (){
                    setState(() {
                      isHide = !isHide;
                    });
                  },
                  child: Icon(
                      isHide ?
                      widget.iconDataPassword![0] :
                      widget.iconDataPassword![1],
                    color: widget.iconColor,
                  ),
                ),
            border: InputBorder.none,
            hintText: widget.hintText,
            hintStyle: GoogleFonts.poppins(
              textStyle: TextStyle(
                fontSize: widget.fontSize,
                fontWeight: widget.fontWeight,
                color: const  Color(0xFFB5B1CC),
              )
            )
        ),
      ),
    );
  }
}
