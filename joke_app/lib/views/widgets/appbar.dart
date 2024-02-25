import 'export.dart';
import 'package:joke_app/views/widgets/text_animation.dart';

class MyAppBar extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  const MyAppBar({Key? key, required this.text, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppThemes.backgroundColor,
      elevation: 10.sp,
      shadowColor: AppThemes.blackColor,
      title: SizedBox(
        width: 60.w,
        child: Center(
          child: TextAnimation(
            onPressed: (){},
            text: text,
            size: 20,
          ),
        ),
      ),
      centerTitle: true,
      leading: IconButton(
          onPressed: onPressed,
          icon: Icon(
            Icons.menu_open_rounded,
            color: AppThemes.blackColor,
            size: 25.sp,
          )),
      actions: [
        PopupMenuButton(
          itemBuilder: (context) => [
            PopupMenuItem(
              height: 4.h,
              onTap: (){},
                child: Row(
                  children: [
                    Icon(Icons.star_border_rounded),
                    Text('Favourite'),
                  ],
                ))
          ],
        )
      ],
    );
  }
}
