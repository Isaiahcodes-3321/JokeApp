import '../export.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CopyJoke {
  static snackBar(BuildContext context, String text) async {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: AppThemes.whiteColor,
        content:
            Text(text, style: AppTextStyle.regular().copyWith(fontSize: 18.sp)),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  static copyJoke(BuildContext context) {
    var singleJoke = refProvider.watch(singleJokeP);
    var setUpText = refProvider.watch(setUpP);
    var deliveryText = refProvider.watch(deliveryP);
    if (singleJoke.isEmpty && setUpText.isEmpty) {
      snackBar(context, "No Joke To Copy");
    } else {
      FlutterClipboard.copy('$singleJoke $setUpText $deliveryText')
          .then((value) => snackBar(context, "Joke Copied"));
    }
  }
}
