import 'export.dart';

class StackBody extends StatelessWidget {
  final Widget  widget;
  final Widget twoTaps;
  final Widget generateJoke;
  const StackBody({Key? key, required this.twoTaps, required this.generateJoke, required this.widget})
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
              child: 
              Center(child: Padding(
                padding: EdgeInsets.only(left: 3.w, right: 3.w),
                child: widget,
              ),),
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
