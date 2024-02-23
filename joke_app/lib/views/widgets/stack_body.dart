import 'export.dart';



class StackBody extends StatelessWidget {
  final Widget twoTaps;
  final Widget generateJoke;
  const StackBody({Key? key, required this.twoTaps, required this.generateJoke})
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
          Container(
            width: AppConstantValues.width * 0.9,
            height: AppConstantValues.height * 0.6,
            decoration: BoxDecoration(
                color: AppThemes.whiteColor,
                borderRadius: BorderRadius.circular(20.sp)),
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
