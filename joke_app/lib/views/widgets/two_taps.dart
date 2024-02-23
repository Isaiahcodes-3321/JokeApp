import 'export.dart';



class TwoTaps extends StatelessWidget {
    final VoidCallback onPressed;
  const TwoTaps({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90.w,
      height: 8.h,
      decoration: BoxDecoration(
        color: AppThemes.whiteColor,
        borderRadius: BorderRadius.circular(15.sp),
        border: Border.all(color: AppThemes.blackColor, width: 7.sp),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            icon: Icon(Icons.star, size: 24.sp),
            onPressed: onPressed,
          ),
          IconButton(
            icon: Icon(Icons.content_copy, size: 24.sp),
            onPressed: onPressed,
          ),
        ],
      ),
    );
  }
}
