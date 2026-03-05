import 'package:flutter/cupertino.dart';
import 'package:joke_app/controller/export.dart';
import 'package:joke_app/services/storage/joke_storage.dart';
import 'package:joke_app/views/widgets/playaudio/play_audio_home.dart'
    hide PlayAudio;
import 'package:joke_app/views/widgets/playaudio/play_fav_audio.dart';
import 'package:swiping_card_deck/swiping_card_deck.dart';
import 'package:joke_app/views/app_views/Ads/bannar_ads.dart';
import 'package:joke_app/views/app_views/main_view/export.dart';
import 'package:joke_app/views/app_views/main_view/main_screen.dart';

class FavoriteView extends StatefulWidget {
  const FavoriteView({Key? key}) : super(key: key);

  @override
  State<FavoriteView> createState() => _FavoriteViewState();
}

class _FavoriteViewState extends State<FavoriteView> {
  final Map<int, GlobalKey<PlayAudioState>> _audioKeys = {};

  GlobalKey<PlayAudioState> _getKey(int index) {
    _audioKeys[index] ??= GlobalKey<PlayAudioState>();
    return _audioKeys[index]!;
  }

  @override
  Widget build(BuildContext context) {
    // get joke from hive and put in on a list
    final List<JokeStorage> getJokes = jokeStorage.values.toList();

    return Scaffold(
      backgroundColor: AppThemes.backgroundColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // const FullAds(),
            Center(
              child: SwipingCardDeck(
                cardDeck: List.generate(
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
                  }, () {
                    // play Audio
                    debugPrint("Tap Joke ::: ${getJokes[index].jokeStored}");
                    _getKey(index)
                        .currentState
                        ?.playText(getJokes[index].jokeStored);
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
                    }, () {
                      // play Audio
                      debugPrint("Tap Joke ::: ${getJokes[index].jokeStored}");
                      _getKey(index)
                          .currentState
                          ?.playText(getJokes[index].jokeStored);
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
            SizedBox(height: 2.8.h),
            getJokes.isEmpty
                ? const SizedBox()
                : SizedBox(width: 80.w, child: const DirectionArrow()),
          ],
        ),
      )),
    );
  }

  Card jokeCardWidget(
    int index,
    String joke,
    VoidCallback onPressedDelete,
    VoidCallback onPressedCopy,
    VoidCallback onPressedPlayAudio,
  ) {
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
                  child: Container(
                    // color: Colors.orange,
                    width: 45.w,
                    height: 8.h,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: GestureDetector(
                            onTap: onPressedPlayAudio,
                            child: PlayFavoriteAudio(key: _getKey(index)),
                          ),
                        ),
                        FittedBox(
                          child: IconButton(
                              onPressed: onPressedCopy,
                              icon: Icon(
                                Icons.copy_outlined,
                                color: AppThemes.blackColor,
                                size: 30,
                              )),
                        ),
                        FittedBox(
                          child: IconButton(
                              onPressed: onPressedDelete,
                              icon: const Icon(
                                Icons.delete_outline_rounded,
                                color: Colors.red,
                                size: 40,
                              )),
                        ),
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

class DirectionArrow extends StatefulWidget {
  const DirectionArrow({Key? key}) : super(key: key);

  @override
  State<DirectionArrow> createState() => _DirectionArrowState();
}

class _DirectionArrowState extends State<DirectionArrow>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _buildArrowRow({required bool isBack}) {
    int count = 4;
    final icons = List.generate(
      count,
      (index) => AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          final delay = index / count;
          final animValue = (_controller.value - delay).clamp(0.0, 1.0);

          final color = ColorTween(
            begin: const Color.fromARGB(255, 231, 208, 2),
            end: const Color.fromARGB(255, 44, 44, 43),
          ).evaluate(CurvedAnimation(
            parent: AlwaysStoppedAnimation(animValue),
            curve: Curves.easeInOut,
          ))!;

          return Icon(
            isBack
                ? Icons.arrow_back_ios_rounded
                : Icons.arrow_forward_ios_rounded,
            color: color,
            size: 30,
          );
        },
      ),
    );

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: isBack ? icons : icons.reversed.toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildArrowRow(isBack: true),
        SizedBox(width: 4.w),
        _buildArrowRow(isBack: false),
      ],
    );
  }
}
