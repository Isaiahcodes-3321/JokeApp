import 'export.dart';

class MainView extends ConsumerWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

    providerRef = ref;
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
      body: AppBody.appBody(context),
    ));
  }
}

class AppBody {
  static Stack appBody(BuildContext context) {
    return const Stack(children: [
      RandomView(),
      SpookyView(),
      PunView(),
      DarkView(),
      MiscellaneousView(),
      FamousQuotesView(),
      ProgrammingView(),
      DadsView()
    ]);
  }
}
