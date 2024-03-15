import '../export.dart';

class SpookyView extends StatelessWidget {
  const SpookyView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      refProvider = ref;
      var singleJokeText = ref.watch(singleJokeP);
      var setUpText = ref.watch(setUpP);
      var deliveryText = ref.watch(deliveryP);
      var jokeLoading = refProvider.watch(isLoading);

      return StackBody(
        widget: singleJokeText.isEmpty && setUpText.isEmpty
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
            : singleJokeText.isNotEmpty
                ? Column(
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
                        singleJokeText,
                        textAlign: TextAlign.center,
                        style: AppTextStyle.regular().copyWith(fontSize: 18.sp),
                      )
                    ],
                  )
                : setUpText.isNotEmpty
                    ? Column(
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
                            setUpText,
                            textAlign: TextAlign.center,
                            style: AppTextStyle.regular()
                                .copyWith(fontSize: 18.sp),
                          ),
                          SizedBox(height: 1.h),
                          Text(
                            deliveryText,
                            textAlign: TextAlign.center,
                            style: AppTextStyle.regular()
                                .copyWith(fontSize: 18.sp),
                          ),
                        ],
                      )
                    : const SizedBox(),

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
