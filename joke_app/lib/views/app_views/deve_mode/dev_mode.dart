import 'package:joke_app/views/app_views/Ads/bannar_ads.dart';
import 'package:joke_app/views/app_views/main_view/export.dart';
import 'package:joke_app/views/widgets/toast_info.dart';
import 'package:url_launcher/url_launcher.dart';

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
                // const FullAds(),
                Center(
                  child: profilePic(context),
                  //  Container(
                  //   width: 50.sp,
                  //   height: 50.sp,
                  //   decoration: BoxDecoration(
                  //     shape: BoxShape.circle,
                  //     image: DecorationImage(
                  //         fit: BoxFit.cover,
                  //         image: AssetImage(
                  //           AppImages.devImage,
                  //         )),
                  //   ),
                  // ),
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
                        text('Personal Information', bigFontSize, () {}),
                        SizedBox(
                          height: 2.h,
                        ),
                        text('Name', bigFontSize, () {}),
                        text('Shell Isaiah', smallFontSize, () {}),
                        SizedBox(
                          height: 2.h,
                        ),
                        text('Stack', bigFontSize, () {}),
                        text('Mobile Developer', smallFontSize, () {}),
                        SizedBox(
                          height: 2.h,
                        ),
                        text('Email', bigFontSize, () {}),
                        FittedBox(
                            child: text('shellisaiah2020@gmail.com',
                                smallFontSize, () {})),
                        SizedBox(
                          height: 2.h,
                        ),
                        text('Git URL', bigFontSize, () {}),
                        FittedBox(
                          child: GestureDetector(
                            onTap: () async {
                              await launchWebPage();
                            },
                            child: SelectableText(
                              'https://github.com/Isaiahcodes-3321',
                              style: AppTextStyle.regular()
                                  .copyWith(fontSize: smallFontSize),
                            ),
                          ),
                        ),
                        // SizedBox(
                        //   height: 2.h,
                        // ),
                        // text('Twitter', bigFontSize),
                        // text('@Isaiah-Codes', smallFontSize),
                        SizedBox(
                          height: 2.h,
                        ),
                        text('Number', bigFontSize, () {}),
                        text('+234 708 416 8504', smallFontSize, () async {
                          await launchPhoneCall('+234 708 416 8504');
                        }),
                      ]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget profilePic(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          barrierColor: Colors.black,
          builder: (_) {
            return Dialog(
              backgroundColor: Colors.transparent,
              insetPadding: EdgeInsets.zero,
              child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: InteractiveViewer(
                  child: Image.asset(
                    AppImages.devImage,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            );
          },
        );
      },
      child: Container(
        width: 50.sp,
        height: 50.sp,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(
              AppImages.devImage,
            ),
          ),
        ),
      ),
    );
  }

  Widget text(String text, var myFontSize, VoidCallback userTap) {
    return GestureDetector(
      onTap: userTap,
      child: Text(
        text,
        style: AppTextStyle.regular().copyWith(fontSize: myFontSize),
      ),
    );
  }

  static Future<void> launchPhoneCall(String number) async {
    debugPrint("driver number $number");
    final Uri phoneCallUrl = Uri.parse('tel:$number');

    if (!await launchUrl(phoneCallUrl)) {
      Toast.errorToast("Could not launch ");
      // throw Exception('Could not launch $phoneCallUrl');
    }
  }

  static Future<void> launchWebPage() async {
    final Uri gitLaunchUrl = Uri.parse('https://github.com/Isaiahcodes-3321');

    if (!await launchUrl(gitLaunchUrl, mode: LaunchMode.externalApplication)) {
      Toast.errorToast("Could not launch ");
      // throw Exception('Could not launch $gitLaunchUrl');
    }
  }

  static Future<void> launchEmailPage() async {
    final Uri emailLaunchUrl = Uri(
      scheme: 'mailto',
      path: 'shellisaiah2020@gmail.com',
      queryParameters: {
        'subject': 'Hello',
        'body': 'Hi Isaiah,',
      },
    );

    if (!await launchUrl(emailLaunchUrl)) {
      Toast.errorToast("Could not launch ");
      // throw Exception('Could not launch $emailLaunchUrl');
    }
  }
}
