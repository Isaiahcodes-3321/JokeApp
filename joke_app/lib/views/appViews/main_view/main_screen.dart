import 'export.dart';
import 'package:joke_app/model/provider/joke_provider.dart';

class MainView extends ConsumerWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

    refProvider = ref;
    return SafeArea(
        child: Scaffold(
      key: _scaffoldKey,
      backgroundColor: AppThemes.backgroundColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(8.h),
        child: MyAppBar(
          text: MainScreenControls.jokeTitle,
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          },
        ),
      ),
      drawer: const DrawerView(),
      body: SizedBox(
          width: 100.w, height: 100.h, child: AppBody.appBody(context)),
    ));
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
