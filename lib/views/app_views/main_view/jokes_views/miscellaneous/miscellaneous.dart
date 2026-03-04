import '../export.dart';
import 'package:joke_app/controller/copy_text.dart/copy.dart';

class MiscellaneousView extends StatelessWidget {
  const MiscellaneousView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      refProvider = ref;
      var jokeText = refProvider.watch(singleJokeP);
      var setUpText = refProvider.watch(setUpP);
      var deliveryText = refProvider.watch(deliveryP);
      var jokeLoading = refProvider.watch(isLoading);

      return StackBody(
        widget: jokeText.isEmpty && setUpText.isEmpty
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
            : jokeText.isNotEmpty
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
                        jokeText,
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

        // to display  buttons to add to favorite and copy joke
        twoTaps: TwoTaps(
          onPressedCopy: () => CopyJoke.copyJoke(context),
        ),
        generateJoke: AppButton(
          onPressed: () => AppNetwork.networkState(context),
        ),
      );
    });
  }
}
