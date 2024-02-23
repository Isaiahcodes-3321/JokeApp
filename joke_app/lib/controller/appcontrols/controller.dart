import 'package:joke_app/controller/provider_ref.dart';
import 'package:joke_app/controller/providers/main_screen_provider.dart';

class MainScreenControls {
  static String jokeTitle = 'Random Jokes';
  static changeJokeTitle() {
    if (providerRef.watch(ProviderAppBarStatus.randomJokes)) {
      jokeTitle = 'Random Jokes';
    } else if (providerRef.watch(ProviderAppBarStatus.spookyJokes)) {
      jokeTitle = 'Spooky Jokes';
    } else if (providerRef.watch(ProviderAppBarStatus.punJokes)) {
      jokeTitle = 'Pun Jokes';
    } else if (providerRef.watch(ProviderAppBarStatus.darkJokes)) {
      jokeTitle = 'Dark Jokes';
    } else if (providerRef.watch(ProviderAppBarStatus.miscellaneousJokes)) {
      jokeTitle = 'Miscellaneous Jokes';
    } else if (providerRef.watch(ProviderAppBarStatus.famousJokes)) {
      jokeTitle = 'Famous Quotes';
    } else if (providerRef.watch(ProviderAppBarStatus.programmingJokes)) {
      jokeTitle = 'Programming Jokes';
    } else if (providerRef.watch(ProviderAppBarStatus.dadsJokes)) {
      jokeTitle = 'Dads Jokes';
    }
    // providerRef.watch(counterProvider) = true
  }

  static isRandomClick() {
    providerRef.read(ProviderAppBarStatus.dadsJokes.notifier).state = false;
    providerRef.read(ProviderAppBarStatus.programmingJokes.notifier).state =
        false;
    providerRef.read(ProviderAppBarStatus.famousJokes.notifier).state = false;
    providerRef.read(ProviderAppBarStatus.miscellaneousJokes.notifier).state =
        false;
    providerRef.read(ProviderAppBarStatus.darkJokes.notifier).state = false;
    providerRef.read(ProviderAppBarStatus.spookyJokes.notifier).state = false;
    providerRef.read(ProviderAppBarStatus.punJokes.notifier).state = false;
    providerRef.read(ProviderAppBarStatus.randomJokes.notifier).state = true;
  }

  static isSpookyClick() {
    providerRef.read(ProviderAppBarStatus.dadsJokes.notifier).state = false;
    providerRef.read(ProviderAppBarStatus.programmingJokes.notifier).state =
        false;
    providerRef.read(ProviderAppBarStatus.famousJokes.notifier).state = false;
    providerRef.read(ProviderAppBarStatus.miscellaneousJokes.notifier).state =
        false;
    providerRef.read(ProviderAppBarStatus.darkJokes.notifier).state = false;
    providerRef.read(ProviderAppBarStatus.randomJokes.notifier).state = false;
    providerRef.read(ProviderAppBarStatus.punJokes.notifier).state = false;
    providerRef.read(ProviderAppBarStatus.spookyJokes.notifier).state = true;
  }

  static isPunClick() {
    providerRef.read(ProviderAppBarStatus.dadsJokes.notifier).state = false;
    providerRef.read(ProviderAppBarStatus.programmingJokes.notifier).state =
        false;
    providerRef.read(ProviderAppBarStatus.famousJokes.notifier).state = false;
    providerRef.read(ProviderAppBarStatus.miscellaneousJokes.notifier).state =
        false;
    providerRef.read(ProviderAppBarStatus.darkJokes.notifier).state = false;
    providerRef.read(ProviderAppBarStatus.randomJokes.notifier).state = false;
    providerRef.read(ProviderAppBarStatus.spookyJokes.notifier).state = false;
    providerRef.read(ProviderAppBarStatus.punJokes.notifier).state = true;
  }

  static isDarkClick() {
    providerRef.read(ProviderAppBarStatus.dadsJokes.notifier).state = false;
    providerRef.read(ProviderAppBarStatus.programmingJokes.notifier).state =
        false;
    providerRef.read(ProviderAppBarStatus.famousJokes.notifier).state = false;
    providerRef.read(ProviderAppBarStatus.miscellaneousJokes.notifier).state =
        false;
    providerRef.read(ProviderAppBarStatus.randomJokes.notifier).state = false;
    providerRef.read(ProviderAppBarStatus.spookyJokes.notifier).state = false;
    providerRef.read(ProviderAppBarStatus.punJokes.notifier).state = false;
    providerRef.read(ProviderAppBarStatus.darkJokes.notifier).state = true;
  }

  static isMiscellaneousClick() {
    providerRef.read(ProviderAppBarStatus.dadsJokes.notifier).state = false;
    providerRef.read(ProviderAppBarStatus.programmingJokes.notifier).state =
        false;
    providerRef.read(ProviderAppBarStatus.famousJokes.notifier).state = false;
    providerRef.read(ProviderAppBarStatus.randomJokes.notifier).state = false;
    providerRef.read(ProviderAppBarStatus.spookyJokes.notifier).state = false;
    providerRef.read(ProviderAppBarStatus.punJokes.notifier).state = false;
    providerRef.read(ProviderAppBarStatus.darkJokes.notifier).state = false;
    providerRef.read(ProviderAppBarStatus.miscellaneousJokes.notifier).state =
        true;
  }

  static isFamousClick() {
    providerRef.read(ProviderAppBarStatus.dadsJokes.notifier).state = false;
    providerRef.read(ProviderAppBarStatus.programmingJokes.notifier).state =
        false;
    providerRef.read(ProviderAppBarStatus.miscellaneousJokes.notifier).state =
        false;
    providerRef.read(ProviderAppBarStatus.famousJokes.notifier).state = false;
    providerRef.read(ProviderAppBarStatus.randomJokes.notifier).state = false;
    providerRef.read(ProviderAppBarStatus.spookyJokes.notifier).state = false;
    providerRef.read(ProviderAppBarStatus.punJokes.notifier).state = false;
    providerRef.read(ProviderAppBarStatus.darkJokes.notifier).state = false;
    providerRef.read(ProviderAppBarStatus.famousJokes.notifier).state = true;
  }

  static isProgrammingClick() {
    providerRef.read(ProviderAppBarStatus.dadsJokes.notifier).state = false;
    providerRef.read(ProviderAppBarStatus.miscellaneousJokes.notifier).state =
        false;
    providerRef.read(ProviderAppBarStatus.famousJokes.notifier).state = false;
    providerRef.read(ProviderAppBarStatus.randomJokes.notifier).state = false;
    providerRef.read(ProviderAppBarStatus.spookyJokes.notifier).state = false;
    providerRef.read(ProviderAppBarStatus.punJokes.notifier).state = false;
    providerRef.read(ProviderAppBarStatus.darkJokes.notifier).state = false;
    providerRef.read(ProviderAppBarStatus.famousJokes.notifier).state = false;
    providerRef.read(ProviderAppBarStatus.programmingJokes.notifier).state =
        true;
  }

  static isDadsJokeClick() {
    providerRef.read(ProviderAppBarStatus.miscellaneousJokes.notifier).state =
        false;
    providerRef.read(ProviderAppBarStatus.famousJokes.notifier).state = false;
    providerRef.read(ProviderAppBarStatus.randomJokes.notifier).state = false;
    providerRef.read(ProviderAppBarStatus.spookyJokes.notifier).state = false;
    providerRef.read(ProviderAppBarStatus.punJokes.notifier).state = false;
    providerRef.read(ProviderAppBarStatus.darkJokes.notifier).state = false;
    providerRef.read(ProviderAppBarStatus.famousJokes.notifier).state = false;
    providerRef.read(ProviderAppBarStatus.programmingJokes.notifier).state =
        false;
    providerRef.read(ProviderAppBarStatus.dadsJokes.notifier).state = true;
  }
}
