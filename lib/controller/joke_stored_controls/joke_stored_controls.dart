import 'package:joke_app/controller/export.dart';
import 'package:joke_app/services/storage/joke_storage.dart';
import 'package:joke_app/views/widgets/toast_info.dart';
// ignore_for_file: use_build_context_synchronously

class JokeControls {
  static addJoke(BuildContext context) async {
    String jokeText = refProvider.watch(singleJokeP);
    String setUpText = refProvider.watch(setUpP);
    String deliveryText = refProvider.watch(deliveryP);
    var ifJokeAddedToFavorite = refProvider.watch(isFavoriteClick);

    String joke = '$jokeText $setUpText\n$deliveryText';
    var favoriteJoke = JokeStorage(jokeStored: joke);

    debugPrint("Displayed Joke :: $joke");
    if (jokeText.isEmpty && setUpText.isEmpty && deliveryText.isEmpty) {
      Toast.errorToast('Joke its empty');
    } else {
      if (ifJokeAddedToFavorite) {
        Toast.errorToast('Joke already added to favorite');
        // CopyJoke.snackBar(context, 'Joke already added to favorite');
      } else {
        await jokeStorage.add(favoriteJoke);
        refProvider.read(isFavoriteClick.notifier).state = true;
        Toast.successToast('Joke added to favorite');
        // CopyJoke.snackBar(context, 'Joke added to favorite');
      }
    }
  }

  static removeJoke() {}
}
