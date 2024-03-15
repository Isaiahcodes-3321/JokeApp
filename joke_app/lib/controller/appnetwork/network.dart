import 'package:flutter/material.dart';
import 'package:joke_app/model/apis/pun_api.dart';
import 'package:joke_app/model/apis/dark_api.dart';
import 'package:joke_app/model/apis/daddy_joke.dart';
import 'package:joke_app/model/apis/random_api.dart';
import 'package:joke_app/model/apis/spooky_api.dart';
import 'package:joke_app/model/apis/programming_api.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:joke_app/model/provider/joke_provider.dart';
import 'package:joke_app/model/apis/miscellaneous_joke.dart';
import 'package:joke_app/model/provider/appbar_providers/main_screen_provider.dart';

class AppNetwork {
  static networkState(BuildContext context) async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('No internet connection'),
          duration: Duration(seconds: 2),
        ),
      );
    } else {
      refProvider.read(isLoading.notifier).state = 'Loading';
         var jokeLoading = refProvider.watch(isLoading);
      print('isss $jokeLoading');

      if (refProvider.watch(ProviderAppBarStatus.randomJokes)) {
        RandomApi.randomJoke();
      } else if (refProvider.watch(ProviderAppBarStatus.spookyJokes)) {
        SpookyApi.spookyApiJoke();
      } else if (refProvider.watch(ProviderAppBarStatus.punJokes)) {
        PunApi.punApiJoke();
      } else if (refProvider.watch(ProviderAppBarStatus.programmingJokes)) {
        ProgrammingApi.programmingJoke();
      } else if (refProvider.watch(ProviderAppBarStatus.darkJokes)) {
        DarkApi.darkJoke();
      } else if (refProvider.watch(ProviderAppBarStatus.miscellaneousJokes)) {
        MiscellaneousApi.miscellaneousJoke();
      } else if (refProvider.watch(ProviderAppBarStatus.dadsJokes)) {
        DaddyApi.daddyJoke();
      }
    }
  }
}
