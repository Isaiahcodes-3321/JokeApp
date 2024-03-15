import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:joke_app/model/apis/joke_varable.dart';
import 'package:joke_app/model/provider/joke_provider.dart';

class ProgrammingApi {
  static Future programmingJoke() async {
    resetJokes();
    print('calling Programming jokes');
    var url = Uri.https('v2.jokeapi.dev', '/joke/Programming');
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
