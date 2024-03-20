import 'export.dart';
import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:joke_app/model/apis/joke_varable.dart';
import 'package:joke_app/model/provider/joke_provider.dart';
import 'package:joke_app/views/app_views/favorite_view/favorite.dart';

class MainView extends ConsumerWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

    refProvider = ref;
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: AppThemes.backgroundColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(8.h),
        child: MyAppBar(
          naveIcon: Icons.menu_open_rounded,
          text: MainScreenControls.jokeTitle,
          onPressed: () {
            resetJokes();
            _scaffoldKey.currentState?.openDrawer();
            refProvider.read(isLoading.notifier).state = '';
          },
          popupMenuButton: PopupMenuButton(
            iconSize: 23,
            itemBuilder: (context) => [
              PopupMenuItem(
                  height: 4.h,
                  onTap: () {
                    Navigator.of(context).push<void>(CupertinoPageRoute(
                      builder: (context) {
                        return const FavoriteView();
                      },
                    ));
                  },
                  child: Row(
                    children: [
                      const Icon(
                        Icons.star_border_rounded,
                        size: 20,
                      ),
                      FittedBox(
                        child: TextAnimation(
                          onPressed: () {
                            Navigator.of(context).push<void>(CupertinoPageRoute(
                              builder: (context) {
                                return const FavoriteView();
                              },
                            ));
                          },
                          text: 'Favorite',
                          size: 17,
                        ),
                      ),
                    ],
                  ))
            ],
          ),
        ),
      ),
      drawer: const DrawerView(),
      body: PopScope(
        canPop: true,
        onPopInvoked: (didPop) {
          SystemNavigator.pop();
        },
        child: SafeArea(
          child: SizedBox(
              width: 100.w, height: 100.h, child: AppBody.appBody(context)),
        ),
      ),
    );
  }
}

class AppBody {
  static Stack appBody(BuildContext context) {
    return Stack(children: [
      refProvider.watch(ProviderAppBarStatus.randomJokes)
          ? const RandomView()
          : const SizedBox(),
      refProvider.watch(ProviderAppBarStatus.spookyJokes)
          ? const SpookyView()
          : const SizedBox(),
      refProvider.watch(ProviderAppBarStatus.punJokes)
          ? const PunView()
          : const SizedBox(),
      const DarkView(),
      refProvider.watch(ProviderAppBarStatus.miscellaneousJokes)
          ? const MiscellaneousView()
          : const SizedBox(),
      refProvider.watch(ProviderAppBarStatus.programmingJokes)
          ? const ProgrammingView()
          : const SizedBox(),
      refProvider.watch(ProviderAppBarStatus.dadsJokes)
          ? const DadsView()
          : const SizedBox()
    ]);
  }
}
