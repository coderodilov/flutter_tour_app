import 'package:flutter/cupertino.dart';

class AppActions{
  static clearAllFocus(BuildContext context){
    FocusScope.of(context).requestFocus(FocusNode());
  }
}