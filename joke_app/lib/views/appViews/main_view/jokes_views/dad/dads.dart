import '../export.dart';

class DadsView extends StatelessWidget {
  const DadsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      refProvider = ref;
      var jokeText = ref.watch(singleJokeP);
         var jokeLoading = refProvider.watch(isLoading);

      return StackBody(
        widget: jokeText.isEmpty
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    AppImages.sadEmojiPng,
                    width: 40.w,
                  ),
                  Text(
                    jokeLoading,
                    textAlign: TextAlign.center,
                    style: AppTextStyle.regular().copyWith(fontSize: 18.sp),
                  )
                ],
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FittedBox(
                    child: Image.asset(
                      AppImages.laughingEmojiPng,
                      width: 40.w,
                    ),
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    jokeText,
                    textAlign: TextAlign.center,
                    style: AppTextStyle.regular().copyWith(fontSize: 18.sp),
                  )
                ],
              ),

        //
        twoTaps: TwoTaps(
          onPressedCopy: () {},
          onPressedFavorite: () {},
          color: Colors.grey,
        ),
        generateJoke: AppButton(
          onPressed: () => AppNetwork.networkState(context),
        ),
      );
    });
  }
}
