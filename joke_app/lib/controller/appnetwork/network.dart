import '../export.dart';


class AppNetwork {
  static networkState(BuildContext context) async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      // ignore: use_build_context_synchronously
      CopyJoke.snackBar(context, 'No internet connection');
    } else {
      refProvider.read(isLoading.notifier).state = 'Loading';
      if (refProvider.watch(ProviderAppBarStatus.randomJokes)) {
        MainScreenControls.apiChanging = '/joke/Any';
        V2JokeApi.v2JokeApiCalling();
      } else if (refProvider.watch(ProviderAppBarStatus.spookyJokes)) {
        MainScreenControls.apiChanging = '/joke/Spooky';
        V2JokeApi.v2JokeApiCalling();
      } else if (refProvider.watch(ProviderAppBarStatus.punJokes)) {
        MainScreenControls.apiChanging = '/joke/Pun';
        V2JokeApi.v2JokeApiCalling();
      } else if (refProvider.watch(ProviderAppBarStatus.programmingJokes)) {
        MainScreenControls.apiChanging = '/joke/Programming';
        V2JokeApi.v2JokeApiCalling();
      } else if (refProvider.watch(ProviderAppBarStatus.darkJokes)) {
        MainScreenControls.apiChanging = '/joke/Dark';
        V2JokeApi.v2JokeApiCalling();
      } else if (refProvider.watch(ProviderAppBarStatus.miscellaneousJokes)) {
        MainScreenControls.apiChanging = '/joke/Miscellaneous';
        V2JokeApi.v2JokeApiCalling();
      } else if (refProvider.watch(ProviderAppBarStatus.dadsJokes)) {
        DaddyApi.daddyJoke();
      }
    }
  }
}
