import 'package:joke_app/model/provider/joke_provider.dart';

String singleJoke = '';
String multipleJokeSetup = '';
String multipleJokeDelivery = '';

Future resetJokes() async {
  refProvider.read(singleJokeP.notifier).state = "";
  refProvider.read(deliveryP.notifier).state = "";
  refProvider.read(setUpP.notifier).state = "";
}
