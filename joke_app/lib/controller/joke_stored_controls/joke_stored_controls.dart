import 'package:joke_app/controller/export.dart';
import 'package:joke_app/model/storage/joke_storage.dart';
// ignore_for_file: use_build_context_synchronously


class JokeControls {
  static addJoke(BuildContext context) async {
    var jokeText = refProvider.watch(singleJokeP);
    var setUpText = refProvider.watch(setUpP);
    var deliveryText = refProvider.watch(deliveryP);
    var ifJokeAddedToFavorite = refProvider.watch(isFavoriteClick);

    var favoriteJoke =
        JokeStorage(jokeStored: '$jokeText $setUpText\n$deliveryText');
    if (ifJokeAddedToFavorite) {
      CopyJoke.snackBar(context, 'Joke already added to favorite');
    } else {
      await jokeStorage.add(favoriteJoke);
      refProvider.read(isFavoriteClick.notifier).state = true;
      CopyJoke.snackBar(context, 'Joke added to favorite');
    }
  }

  static removeJoke() {}
}
