import 'export.dart';


class TextAnimation extends StatelessWidget {
  final String text;
  final double size;
   final VoidCallback onPressed;
  const TextAnimation({super.key, required this.text, required this.size, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: ColorizeAnimatedTextKit(
              onTap: onPressed,
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
      ),
    );
  }
}
