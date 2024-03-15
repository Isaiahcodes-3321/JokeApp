import 'export.dart';

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
          child: FittedBox(
            child: TextAnimation(
              onPressed: () {},
              text: text,
              size: 20.sp,
            ),
          ),
        ),
      ),
      centerTitle: true,
      leading: IconButton(
          onPressed: onPressed,
          icon: Icon(
            Icons.menu_open_rounded,
            color: AppThemes.blackColor,
            size: 23,
          )),
      actions: [
        PopupMenuButton(
          iconSize: 23,
          itemBuilder: (context) => [
            PopupMenuItem(
                height: 4.h,
                onTap: () {},
                child: Row(
                  children: [
                   const Icon(Icons.star_border_rounded, size: 20,),
                    TextAnimation(
                      onPressed: () {},
                      text: 'Favorite',
                      size: 19.sp,
                    ),
                  ],
                ))
          ],
        )
      ],
    );
  }
}
