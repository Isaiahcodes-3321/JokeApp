import 'package:flutter/material.dart';
import 'package:joke_app/views/appThemes/themes.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AppConstantValues {
  static late double width;
  static late double height;

  static setWidthAndHeight(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
  }
}

class AppTextStyle {
  static String fontFamily = 'ProtestRevolution-Regular';

  static TextStyle regular() {
    return TextStyle(
        fontSize: 18.sp,
        color: AppThemes.blackColor,
        fontFamily: fontFamily,
        fontWeight: FontWeight.normal);
  }

  static TextStyle bold() {
    return TextStyle(
        fontSize: 18.sp,
        color: AppThemes.blackColor,
        fontFamily: fontFamily,
        fontWeight: FontWeight.bold);
  }
}
