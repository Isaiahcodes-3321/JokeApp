import 'package:flutter/cupertino.dart';
import 'package:clipboard/clipboard.dart';
import 'package:joke_app/model/storage/joke_storage.dart';
import 'package:swiping_card_deck/swiping_card_deck.dart';
import 'package:joke_app/views/app_views/Ads/bannar_ads.dart';
import 'package:joke_app/controller/copy_text.dart/copy.dart';
import 'package:joke_app/views/app_views/main_view/export.dart';
import 'package:joke_app/views/app_views/main_view/main_screen.dart';

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
        child: Column( crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // const FullAds(),
            Center(
              child: SwipingCardDeck(
                cardDeck: List.generate(
                  getJokes.length,
                  (index) => jokeCardWidget(index, getJokes[index].jokeStored, () {
                    setState(() {
                      // print('to delete joke');
                      jokeStorage.deleteAt(index);
                    });
                  }, () {
                    // print('to copy joke');
                    FlutterClipboard.copy(getJokes[index].jokeStored)
                        .then((value) => CopyJoke.snackBar(context, "Joke Copied"));
                  }),
                ),
                onDeckEmpty: () => setState(() {
                  List.generate(
                    getJokes.length,
                    (index) =>
                        jokeCardWidget(index, getJokes[index].jokeStored, () {
                      setState(() {
                        // print('to delete joke');
                        jokeStorage.deleteAt(index);
                      });
                    }, () {
                      // print('to copy joke');
                      FlutterClipboard.copy(getJokes[index].jokeStored).then(
                          (value) => CopyJoke.snackBar(context, "Joke Copied"));
                    }),
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
          ],
        ),
      )),
    );
  }

  Card jokeCardWidget(int index, String joke, VoidCallback onPressedDelete,
      VoidCallback onPressedCopy) {
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
          height: 60.h,
          width: 80.w,
          child: Padding(
            padding: EdgeInsets.only(left: 2.w, right: 2.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 100.w,
                  height: 50.h,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FittedBox(
                        child: Image.asset(
                          AppImages.laughingEmojiPng,
                          width: 30.w,
                        ),
                      ),
                      SizedBox(height: 2.h),
                      Text(
                        joke,
                        textAlign: TextAlign.center,
                        style: AppTextStyle.regular().copyWith(fontSize: 18.sp),
                      )
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: SizedBox(
                    width: 35.w,
                    height: 8.h,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        FittedBox(
                          child: IconButton(
                              onPressed: onPressedDelete,
                              icon: const Icon(
                                Icons.delete_outline_rounded,
                                color: Colors.red,
                                size: 40,
                              )),
                        ),
                        FittedBox(
                          child: IconButton(
                              onPressed: onPressedCopy,
                              icon: Icon(
                                Icons.copy_outlined,
                                color: AppThemes.blackColor,
                                size: 30,
                              )),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
