import 'export.dart';
import 'package:joke_app/model/provider/joke_provider.dart';
import 'package:joke_app/views/appViews/main_view/export.dart';
import 'package:joke_app/controller/joke_stored_controls/joke_stored_controls.dart';

class TwoTaps extends StatelessWidget {
  final VoidCallback onPressedCopy;
  const TwoTaps({
    Key? key,
    required this.onPressedCopy,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var isIconClick = refProvider.watch(isFavoriteClick);

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
          FittedBox(
            child: IconButton(
              icon: const Icon(Icons.star_border_rounded, size: 30),
              onPressed: () async {
                await JokeControls.addJoke(context);
              },
              color: isIconClick ? AppThemes.blackColor : AppThemes.grayColor,
            ),
          ),
          FittedBox(
            child: IconButton(
              icon: const Icon(Icons.content_copy, size: 25),
              onPressed: onPressedCopy,
            ),
          ),
        ],
      ),
    );
  }
}
