import 'export.dart';



class TwoTaps extends StatelessWidget {
    final VoidCallback onPressedCopy;
     final VoidCallback onPressedFavorite;
     final Color color;
  const TwoTaps({Key? key, required this.onPressedCopy, required this.onPressedFavorite, required this.color, }) : super(key: key);

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
            icon: Icon(Icons.star_border_rounded, size: 24.sp),
            onPressed: onPressedFavorite,
            color: color,
          ),
          IconButton(
            icon: Icon(Icons.content_copy, size: 24.sp),
            onPressed: onPressedCopy,
          ),
        ],
      ),
    );
  }
}
