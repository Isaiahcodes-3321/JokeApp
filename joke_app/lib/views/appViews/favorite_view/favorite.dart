import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:joke_app/views/widgets/appbar.dart';
import 'package:joke_app/views/appThemes/themes.dart';
import 'package:joke_app/views/constant/constant.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:joke_app/views/appThemes/appImages.dart';
import 'package:joke_app/model/storage/joke_storage.dart';
import 'package:swiping_card_deck/swiping_card_deck.dart';
import 'package:joke_app/views/appViews/main_view/main_screen.dart';

class FavoriteView extends StatefulWidget {
  const FavoriteView({Key? key}) : super(key: key);

  @override
  State<FavoriteView> createState() => _FavoriteViewState();
}

class _FavoriteViewState extends State<FavoriteView> {
  @override
  Widget build(BuildContext context) {
    // get joke from hive and put in on a list
    final List<JokeStorage> getJokes = jokeStorage.values.toList();

    return Scaffold(
      backgroundColor: AppThemes.backgroundColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(8.h),
        child: MyAppBar(
          naveIcon: Icons.arrow_back_rounded,
          onPressed: () => Navigator.of(context).push<void>(CupertinoPageRoute(
            builder: (context) {
              return const MainView();
            },
          )),
          text: "My Favorite Jokes",
          popupMenuButton: const SizedBox(),
        ),
      ),
      body: SafeArea(
          child: SizedBox(
        width: 100.w,
        height: 100.h,
        child: Center(
          child: SwipingCardDeck(
            cardDeck: List.generate(
              getJokes.length,
              (index) => jokeCardWidget(index),
            ),
            onDeckEmpty: () => setState(() {
              List.generate(
                getJokes.length,
                (index) => jokeCardWidget(index),
              );
            }),
            onLeftSwipe: (Card card) => debugPrint("Swiped left!"),
            onRightSwipe: (Card card) => debugPrint("Swiped right!"),
            swipeThreshold: MediaQuery.of(context).size.width / 4,
            minimumVelocity: 500,
            cardWidth: 80.w,
            rotationFactor: 0.8 / 3.14,
            swipeAnimationDuration: const Duration(milliseconds: 500),
            disableDragging: false,
          ),
        ),
      )),
    );
  }

  Card jokeCardWidget(int index) {
    // get joke from hive and put in on a list
    final List<JokeStorage> getJokes = jokeStorage.values.toList();

    return Card(
      color: AppThemes.whiteColor,
      elevation: 10.sp,
      child: Banner(
        message: 'I JOKES',
        textStyle: AppTextStyle.bold()
            .copyWith(fontSize: 18.sp, color: AppThemes.whiteColor),
        location: BannerLocation.topStart,
        color: AppThemes.orangeColor,
        child: SizedBox(
          height: 55.h,
          width: 80.w,
          child: Padding(
            padding: EdgeInsets.only(left: 2.w, right: 2.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FittedBox(
                  child: Image.asset(
                    AppImages.laughingEmojiPng,
                    width: 35.w,
                  ),
                ),
                SizedBox(height: 2.h),
                Text(
                  getJokes[index].jokeStored,
                  textAlign: TextAlign.center,
                  style: AppTextStyle.regular().copyWith(fontSize: 18.sp),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
