import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:joke_app/views/approute/route.dart';
import 'package:joke_app/views/constant/constant.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:joke_app/views/appThemes/appImages.dart';
import 'package:joke_app/views/widgets/text_animation.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  initState() {
    super.initState();
    // Wait for 5 seconds, then navigate to the main screen
    Timer(const Duration(seconds: 6), () {
      AppConstantValues.setWidthAndHeight(context);
      context.goNamed(AppRoute.mainView);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SizedBox(
        width: 100.w,
        height: 100.h,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // ignore: deprecated_member_use
              const TextAnimation(
                text: "I JOKES",
                size: 33,
              ),
              Image.asset(
                AppImages.laughingEmojiPng,
                width: MediaQuery.of(context).size.width * 0.6,
              )
            ]),
      ),
    ));
  }
}
