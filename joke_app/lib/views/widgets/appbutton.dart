import 'export.dart';



class AppButton extends StatelessWidget {
  final VoidCallback onPressed;

  const AppButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: AppThemes.whiteColor,
      shape: OutlineInputBorder(
        borderSide: BorderSide(color: AppThemes.blackColor, width: 7.sp),
        borderRadius: BorderRadius.circular(15.sp),
      ),
      child: Padding(
          padding:
              EdgeInsets.only(left: 25.w, right: 25.w, top: 2.h, bottom: 2.h),
          child: const TextAnimation(
            text: 'Generate Joke',
            size: 19,
          )),
    );
  }
}
