import 'package:joke_app/views/app_views/Ads/bannar_ads.dart';
import 'package:joke_app/views/app_views/main_view/export.dart';

class DevPage extends StatelessWidget {
  const DevPage({super.key});

  @override
  Widget build(BuildContext context) {
    double bigFontSize = 17.0;
    double smallFontSize = 16.0;
    return Scaffold(
      backgroundColor: AppThemes.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppThemes.backgroundColor,
        elevation: 10.sp,
        shadowColor: AppThemes.blackColor,
      ),
      body: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.all(25.sp),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const FullAds(),
                Center(
                  child: Container(
                    width: 50.sp,
                    height: 50.sp,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(
                            AppImages.devImage,
                          )),
                    ),
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                SizedBox(
                  width: double.infinity,
                  height: 60.h,
                  // color: Colors.blue,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        text('Personal Information', bigFontSize),
                        SizedBox(
                          height: 2.h,
                        ),
                        text('Name', bigFontSize),
                        text('Shell Isaiah', smallFontSize),
                        SizedBox(
                          height: 2.h,
                        ),
                        text('Stack', bigFontSize),
                        text('Mobile Developer', smallFontSize),
                        SizedBox(
                          height: 2.h,
                        ),
                        text('Email', bigFontSize),
                        FittedBox(
                            child: text(
                                'isaiahshell2019@gmail.com', smallFontSize)),
                        SizedBox(
                          height: 2.h,
                        ),
                        text('Git URL', bigFontSize),
                        FittedBox(
                          child: SelectableText(
                            'https://github.com/Isaiahcodes-3321',
                            style: AppTextStyle.regular()
                                .copyWith(fontSize: smallFontSize),
                          ),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        text('Twitter', bigFontSize),
                        text('@Isaiah-Codes', smallFontSize),
                        SizedBox(
                          height: 2.h,
                        ),
                        text('Number', bigFontSize),
                        text('+234 701 312 8342', smallFontSize),
                      ]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget text(String text, var myFontSize) {
    return Text(
      text,
      style: AppTextStyle.regular().copyWith(fontSize: myFontSize),
    );
  }
}
