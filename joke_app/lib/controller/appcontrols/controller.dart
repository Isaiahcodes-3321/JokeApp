import 'package:joke_app/model/provider/joke_provider.dart';
import 'package:joke_app/model/provider/appbar_providers/main_screen_provider.dart';

class MainScreenControls {
  static String jokeTitle = 'Random Jokes';
  static changeJokeTitle() {
    if (refProvider.watch(ProviderAppBarStatus.randomJokes)) {
      jokeTitle = 'Random Jokes';
    } else if (refProvider.watch(ProviderAppBarStatus.spookyJokes)) {
      jokeTitle = 'Spooky Jokes';
    } else if (refProvider.watch(ProviderAppBarStatus.punJokes)) {
      jokeTitle = 'Pun Jokes';
    } else if (refProvider.watch(ProviderAppBarStatus.darkJokes)) {
      jokeTitle = 'Dark Jokes';
    } else if (refProvider.watch(ProviderAppBarStatus.miscellaneousJokes)) {
      jokeTitle = 'Miscellaneous Jokes';
    } else if (refProvider.watch(ProviderAppBarStatus.programmingJokes)) {
      jokeTitle = 'Programming Jokes';
    } else if (refProvider.watch(ProviderAppBarStatus.dadsJokes)) {
      jokeTitle = 'Dads Jokes';
    }
  }

  static isRandomClick() {
    refProvider.read(ProviderAppBarStatus.dadsJokes.notifier).state = false;
    refProvider.read(ProviderAppBarStatus.programmingJokes.notifier).state =
        false;
 
    refProvider.read(ProviderAppBarStatus.miscellaneousJokes.notifier).state =
        false;
    refProvider.read(ProviderAppBarStatus.darkJokes.notifier).state = false;
    refProvider.read(ProviderAppBarStatus.spookyJokes.notifier).state = false;
    refProvider.read(ProviderAppBarStatus.punJokes.notifier).state = false;
    refProvider.read(ProviderAppBarStatus.randomJokes.notifier).state = true;
  }

  static isSpookyClick() {
    refProvider.read(ProviderAppBarStatus.dadsJokes.notifier).state = false;
    refProvider.read(ProviderAppBarStatus.programmingJokes.notifier).state =
        false;

    refProvider.read(ProviderAppBarStatus.miscellaneousJokes.notifier).state =
        false;
    refProvider.read(ProviderAppBarStatus.darkJokes.notifier).state = false;
    refProvider.read(ProviderAppBarStatus.randomJokes.notifier).state = false;
    refProvider.read(ProviderAppBarStatus.punJokes.notifier).state = false;
    refProvider.read(ProviderAppBarStatus.spookyJokes.notifier).state = true;
  }

  static isPunClick() {
    refProvider.read(ProviderAppBarStatus.dadsJokes.notifier).state = false;
    refProvider.read(ProviderAppBarStatus.programmingJokes.notifier).state =
        false;

    refProvider.read(ProviderAppBarStatus.miscellaneousJokes.notifier).state =
        false;
    refProvider.read(ProviderAppBarStatus.darkJokes.notifier).state = false;
    refProvider.read(ProviderAppBarStatus.randomJokes.notifier).state = false;
    refProvider.read(ProviderAppBarStatus.spookyJokes.notifier).state = false;
    refProvider.read(ProviderAppBarStatus.punJokes.notifier).state = true;
  }

  static isDarkClick() {
    refProvider.read(ProviderAppBarStatus.dadsJokes.notifier).state = false;
    refProvider.read(ProviderAppBarStatus.programmingJokes.notifier).state =
        false;
   
    refProvider.read(ProviderAppBarStatus.miscellaneousJokes.notifier).state =
        false;
    refProvider.read(ProviderAppBarStatus.randomJokes.notifier).state = false;
    refProvider.read(ProviderAppBarStatus.spookyJokes.notifier).state = false;
    refProvider.read(ProviderAppBarStatus.punJokes.notifier).state = false;
    refProvider.read(ProviderAppBarStatus.darkJokes.notifier).state = true;
  }

  static isMiscellaneousClick() {
    refProvider.read(ProviderAppBarStatus.dadsJokes.notifier).state = false;
    refProvider.read(ProviderAppBarStatus.programmingJokes.notifier).state =
        false;
  
    refProvider.read(ProviderAppBarStatus.randomJokes.notifier).state = false;
    refProvider.read(ProviderAppBarStatus.spookyJokes.notifier).state = false;
   refProvider.read(ProviderAppBarStatus.punJokes.notifier).state = false;
   refProvider.read(ProviderAppBarStatus.darkJokes.notifier).state = false;
   refProvider.read(ProviderAppBarStatus.miscellaneousJokes.notifier).state =
        true;
  }



  static isProgrammingClick() {
    refProvider.read(ProviderAppBarStatus.dadsJokes.notifier).state = false;
    refProvider.read(ProviderAppBarStatus.miscellaneousJokes.notifier).state =
        false;
  
    refProvider.read(ProviderAppBarStatus.randomJokes.notifier).state = false;
    refProvider.read(ProviderAppBarStatus.spookyJokes.notifier).state = false;
    refProvider.read(ProviderAppBarStatus.punJokes.notifier).state = false;
    refProvider.read(ProviderAppBarStatus.darkJokes.notifier).state = false;
  
    refProvider.read(ProviderAppBarStatus.programmingJokes.notifier).state =
        true;
  }

  static isDadsJokeClick() {
    refProvider.read(ProviderAppBarStatus.miscellaneousJokes.notifier).state =
        false;
 
    refProvider.read(ProviderAppBarStatus.randomJokes.notifier).state = false;
    refProvider.read(ProviderAppBarStatus.spookyJokes.notifier).state = false;
    refProvider.read(ProviderAppBarStatus.punJokes.notifier).state = false;
    refProvider.read(ProviderAppBarStatus.darkJokes.notifier).state = false;
 
    refProvider.read(ProviderAppBarStatus.programmingJokes.notifier).state =
        false;
    refProvider.read(ProviderAppBarStatus.dadsJokes.notifier).state = true;
  }
}
