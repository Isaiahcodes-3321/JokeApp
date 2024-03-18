import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:joke_app/model/apis/joke_varable.dart';
import 'package:joke_app/model/provider/joke_provider.dart';
import 'package:joke_app/controller/appcontrols/controller.dart';

class V2JokeApi {
  static Future v2JokeApiCalling() async {
    resetJokes();
    refProvider.read(isFavoriteClick.notifier).state = false;
    var url = Uri.https('v2.jokeapi.dev', MainScreenControls.apiChanging);
    var response = await http.get(url);
    if (response.statusCode == 200 || response.statusCode == 201) {
      print('My joke ${response.body}');
      final responseData = jsonDecode(response.body);
      singleJoke = responseData['joke'] ?? '';
      multipleJokeSetup = responseData['setup'] ?? '';
      multipleJokeDelivery = responseData['delivery'] ?? '';
      updateJokes();
    } else {
      print('error code ${response.body}');
    }
  }

  static Future updateJokes() async {
    refProvider.read(singleJokeP.notifier).state = singleJoke;
    refProvider.read(deliveryP.notifier).state = multipleJokeDelivery;
    refProvider.read(setUpP.notifier).state = multipleJokeSetup;
  }
}
