import 'package:hive/hive.dart';
import 'package:flutter/material.dart';
import 'package:joke_app/views/app_themes/themes.dart';
import 'package:joke_app/model/storage/joke_storage.dart';

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
        fontSize: 18,
        color: AppThemes.blackColor,
        fontFamily: fontFamily,
        fontWeight: FontWeight.normal);
  }

  static TextStyle bold() {
    return TextStyle(
        fontSize: 18,
        color: AppThemes.blackColor,
        fontFamily: fontFamily,
        fontWeight: FontWeight.bold);
  }
}

// variable holding the hive box
late Box<JokeStorage> jokeStorage;

