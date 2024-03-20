import 'export.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:joke_app/model/provider/joke_provider.dart';


class DrawerView extends StatelessWidget {
  const DrawerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppThemes.whiteColor,
      width: AppConstantValues.width * 0.6,
      child: Theme(
        data: Theme.of(context).copyWith(
          dividerTheme: DividerThemeData(color: AppThemes.blackColor),
        ),
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
                            refProvider.watch(ProviderAppBarStatus.randomJokes)
                                ? AppThemes.blackColor
                                : AppThemes.grayColor,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        MainScreenControls.isSpookyClick();
                        MainScreenControls.changeJokeTitle();
                      },
                      child: JokeList(
                        text: 'Spooky',
                        textColor:
                           refProvider.watch(ProviderAppBarStatus.spookyJokes)
                                ? AppThemes.blackColor
                                : AppThemes.grayColor,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        MainScreenControls.isPunClick();
                        MainScreenControls.changeJokeTitle();
                      },
                      child: JokeList(
                        text: 'Pun',
                        textColor:
                            refProvider.watch(ProviderAppBarStatus.punJokes)
                                ? AppThemes.blackColor
                                : AppThemes.grayColor,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        MainScreenControls.isDarkClick();
                        MainScreenControls.changeJokeTitle();
                      },
                      child: JokeList(
                        text: 'Dark',
                        textColor:
                            refProvider.watch(ProviderAppBarStatus.darkJokes)
                                ? AppThemes.blackColor
                                : AppThemes.grayColor,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        MainScreenControls.isMiscellaneousClick();
                        MainScreenControls.changeJokeTitle();
                      },
                      child: JokeList(
                        text: 'Miscellaneous',
                        textColor: refProvider
                                .watch(ProviderAppBarStatus.miscellaneousJokes)
                            ? AppThemes.blackColor
                            : AppThemes.grayColor,
                      ),
                    ),
                  
                    GestureDetector(
                      onTap: () {
                        MainScreenControls.isProgrammingClick();
                        
                        MainScreenControls.changeJokeTitle();
                      },
                      child: JokeList(
                        text: 'Programming',
                        textColor: refProvider
                                .watch(ProviderAppBarStatus.programmingJokes)
                            ? AppThemes.blackColor
                            : AppThemes.grayColor,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        MainScreenControls.isDadsJokeClick();
                        MainScreenControls.changeJokeTitle();
                      },
                      child: JokeList(
                        text: 'Dads Joke',
                        textColor:
                            refProvider.watch(ProviderAppBarStatus.dadsJokes)
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
              FittedBox(
                child: TextAnimation(
                  onPressed: () {},
                  text: 'I JOKES',
                  size: 27,
                ),
              ),
              FittedBox(
                child: Image.asset(
                  AppImages.laughingEmojiPng,
                  width: 60,
                ),
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
          child: AutoSizeText(
        text,
        style: AppTextStyle.regular().copyWith(fontSize: 17, color: textColor),
        maxLines: 2,
      )),
    );
  }
}
