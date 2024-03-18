// import 'dart:convert';
// import 'riverpod.dart';
// import 'package:http/http.dart' as http;

// class ApiCalling {
//   static String joke = '';

//   static String setup = '';
//   static String delivery = '';

//   static Future jokeCalling() async {
//     var url = Uri.https('v2.jokeapi.dev', '/joke/Any');
//     var response = await http.get(url);
//     if (response.statusCode == 200 || response.statusCode == 201) {
//       print('My joke ${response.body}');
//       final responseData = jsonDecode(response.body);
//       joke = responseData['joke'] ?? '';
//       setup = responseData['setup'] ?? '';
//       delivery = responseData['delivery'] ?? '';
//       updateJokes();
//     } else {
//       print('error code ${response.body}');
//     }
//   }

//   static Future updateJokes() async {
//     reff.read(jokeP.notifier).state = joke;
//     reff.read(deliveryP.notifier).state = delivery;
//     reff.read(setUpP.notifier).state = setup;
//   }
// }
