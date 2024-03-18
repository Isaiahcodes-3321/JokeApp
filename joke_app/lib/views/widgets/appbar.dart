import 'export.dart';

class MyAppBar extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Widget popupMenuButton;
  final IconData naveIcon;
 const MyAppBar(
      {super.key,
      required this.text,
      required this.onPressed,
      required this.naveIcon,
      required this.popupMenuButton});

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
            naveIcon,
            color: AppThemes.blackColor,
            size: 23,
          )),
      actions: [
        popupMenuButton,
      ],
    );
  }
}
