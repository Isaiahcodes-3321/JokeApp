import 'export.dart';


class TextAnimation extends StatelessWidget {
  final String text;
  final double size;
  const TextAnimation({Key? key, required this.text, required this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ColorizeAnimatedTextKit(
      text: [text],
      textStyle: AppTextStyle.bold().copyWith(fontSize: size.sp),
      colors: [
        AppThemes.blackColor,
        AppThemes.orangeColor,
        AppThemes.whiteColor,
        AppThemes.blackColor
      ],
      textAlign: TextAlign.center,
      repeatForever: true,
    );
  }
}
