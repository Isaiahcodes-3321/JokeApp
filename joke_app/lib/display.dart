import 'package:joke_app/api.dart';
import 'package:flutter/material.dart';
import 'package:joke_app/riverpod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Display extends StatefulWidget {
  const Display({Key? key}) : super(key: key);

  @override
  State<Display> createState() => _DisplayState();
}

class _DisplayState extends State<Display> {
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      reff = ref;
      var jokeText = ref.watch(jokeP);
      var setUpText = ref.watch(setUpP);
      var deliveryText = ref.watch(deliveryP);

      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('JOKE GENERATOR bb ',
              textAlign: TextAlign.center, style: TextStyle(fontSize: 18)),
        ),
        body: Container(
          color: Colors.white,
          width: double.infinity,
          height: 1000,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Center(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                jokeText.isNotEmpty
                    ? Column(
                        children: [
                          Text(jokeText, textAlign: TextAlign.center),
                        ],
                      )
                    : setUpText.isNotEmpty
                        ? Column(
                            children: [
                              Text(setUpText, textAlign: TextAlign.center),
                             const SizedBox(height: 5),
                              Text(deliveryText, textAlign: TextAlign.center),
                            ],
                          )
                        : const SizedBox(),
                jokeText.isEmpty || setUpText.isEmpty ? const Text('') : const Text(''),
                OutlinedButton(
                    onPressed: () => ApiCalling.jokeCalling(),
                    child: const Text('Generate Code'))
              ],
            )),
          ),
        ),
      );
    });
  }
}
