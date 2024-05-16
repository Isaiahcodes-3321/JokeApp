import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:joke_app/model/apis/joke_varable.dart';
import 'package:joke_app/model/provider/joke_provider.dart';
// ignore_for_file: avoid_print


class DaddyApi {
  static Future daddyJoke() async {
    resetJokes();
    print('calling daddy jokes');
    var url = Uri.https('icanhazdadjoke.com', '');
    var response = await http.get(
      url,
      headers: {'Accept': 'application/json'},
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      print('My joke ${response.body}');
      final responseData = jsonDecode(response.body);
      singleJoke = responseData['joke'] ?? '';
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
