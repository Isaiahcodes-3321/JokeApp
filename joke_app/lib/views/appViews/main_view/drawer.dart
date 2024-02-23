import 'export.dart';


class DrawerView extends StatelessWidget {
  const DrawerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppThemes.whiteColor,
      width: AppConstantValues.width * 0.6,
      child: SizedBox(
        child: ListView(
          children: [
            const HeaderDrawer(),
            SizedBox(
              width: double.infinity,
              height: 64.h,
              child: SingleChildScrollView(
                child: Column(children: [
                  GestureDetector(
                    onTap: () {
                      MainScreenControls.isRandomClick();
                      MainScreenControls.changeJokeTitle();
                    },
                    child: JokeList(
                      text: 'Random',
                      textColor:
                          providerRef.watch(ProviderAppBarStatus.randomJokes)
                              ? AppThemes.blackColor
                              : AppThemes.grayColor,
                    ),
                  ),
                  Divider(
                    color: AppThemes.blackColor,
                  ),
                  GestureDetector(
                    onTap: () {
                      MainScreenControls.isSpookyClick();
                      MainScreenControls.changeJokeTitle();
                    },
                    child: JokeList(
                      text: 'Spooky',
                      textColor:
                          providerRef.watch(ProviderAppBarStatus.spookyJokes)
                              ? AppThemes.blackColor
                              : AppThemes.grayColor,
                    ),
                  ),
                  Divider(
                    color: AppThemes.blackColor,
                  ),
                  GestureDetector(
                    onTap: () {
                      MainScreenControls.isPunClick();
                      MainScreenControls.changeJokeTitle();
                    },
                    child: JokeList(
                      text: 'Pun',
                      textColor:
                          providerRef.watch(ProviderAppBarStatus.punJokes)
                              ? AppThemes.blackColor
                              : AppThemes.grayColor,
                    ),
                  ),
                  Divider(
                    color: AppThemes.blackColor,
                  ),
                  GestureDetector(
                    onTap: () {
                      MainScreenControls.isDarkClick();
                      MainScreenControls.changeJokeTitle();
                    },
                    child: JokeList(
                      text: 'Dark',
                      textColor:
                          providerRef.watch(ProviderAppBarStatus.darkJokes)
                              ? AppThemes.blackColor
                              : AppThemes.grayColor,
                    ),
                  ),
                  Divider(
                    color: AppThemes.blackColor,
                  ),
                  GestureDetector(
                    onTap: () {
                      MainScreenControls.isMiscellaneousClick();
                      MainScreenControls.changeJokeTitle();
                    },
                    child: JokeList(
                      text: 'Miscellaneous',
                      textColor: providerRef
                              .watch(ProviderAppBarStatus.miscellaneousJokes)
                          ? AppThemes.blackColor
                          : AppThemes.grayColor,
                    ),
                  ),
                  Divider(
                    color: AppThemes.blackColor,
                  ),
                  GestureDetector(
                    onTap: () {
                      MainScreenControls.isFamousClick();
                      MainScreenControls.changeJokeTitle();
                    },
                    child: JokeList(
                      text: 'Famous Quotes',
                      textColor:
                          providerRef.watch(ProviderAppBarStatus.famousJokes)
                              ? AppThemes.blackColor
                              : AppThemes.grayColor,
                    ),
                  ),
                  Divider(
                    color: AppThemes.blackColor,
                  ),
                  GestureDetector(
                    onTap: () {
                      MainScreenControls.isProgrammingClick();
                      MainScreenControls.changeJokeTitle();
                    },
                    child: JokeList(
                      text: 'Programming',
                      textColor: providerRef
                              .watch(ProviderAppBarStatus.programmingJokes)
                          ? AppThemes.blackColor
                          : AppThemes.grayColor,
                    ),
                  ),
                  Divider(
                    color: AppThemes.blackColor,
                  ),
                  GestureDetector(
                    onTap: () {
                      MainScreenControls.isDadsJokeClick();
                      MainScreenControls.changeJokeTitle();
                    },
                    child: JokeList(
                      text: 'Dads Joke',
                      textColor:
                          providerRef.watch(ProviderAppBarStatus.dadsJokes)
                              ? AppThemes.blackColor
                              : AppThemes.grayColor,
                    ),
                  ),
                ]),
              ),
            ),
            SizedBox(
              height: 6.h,
              width: double.infinity,
              child:
                  Center(child: Text('V 1.0', style: AppTextStyle.regular())),
            )
          ],
        ),
      ),
    );
  }
}

class HeaderDrawer extends StatelessWidget {
  const HeaderDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Theme(
        data: Theme.of(context).copyWith(
          dividerTheme: DividerThemeData(color: AppThemes.blackColor),
        ),
        child: DrawerHeader(
            child: Center(
          child: Column(
            children: [
              const TextAnimation(
                text: 'I JOKES',
                size: 27,
              ),
              Image.asset(
                AppImages.laughingEmojiPng,
                width: MediaQuery.of(context).size.width * 0.2,
              )
            ],
          ),
        )),
      ),
    );
  }
}

class JokeList extends StatelessWidget {
  final String text;
  final Color textColor;
  const JokeList({Key? key, required this.text, required this.textColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Center(
        child: Text(text,
            style: AppTextStyle.regular()
                .copyWith(fontSize: 20.sp, color: textColor)),
      ),
    );
  }
}
