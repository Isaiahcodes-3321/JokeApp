import 'package:joke_app/views/widgets/playaudio/play_audio_home.dart';

import 'export.dart';

class StackBody extends StatelessWidget {
  final Widget widget;
  final Widget twoTaps;
  final Widget generateJoke;
  const StackBody(
      {Key? key,
      required this.twoTaps,
      required this.generateJoke,
      required this.widget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 5.h,
          ),
          Banner(
            message: 'I JOKES',
            textStyle: AppTextStyle.bold()
                .copyWith(fontSize: 18.sp, color: AppThemes.whiteColor),
            location: BannerLocation.topStart,
            color: AppThemes.orangeColor,
            child: Container(
              width: 90.w,
              height: 60.h,
              decoration: BoxDecoration(
                  color: AppThemes.whiteColor,
                  borderRadius: BorderRadius.circular(20.sp)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    flex: 8,
                    child: SizedBox(
                      width: 100.w,
                      height: 100.h,
                      child: Center(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 3.w),
                          child: widget,
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                      flex: 1,
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 6.w),
                        width: 100.w,
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            PlayAudio(),
                          ],
                        ),
                      ))
                ],
              ),
            ),
          ),
          SizedBox(
            height: 2.h,
          ),
          twoTaps,
          SizedBox(
            height: 2.h,
          ),
          generateJoke
        ],
      ),
    );
  }
}
