import 'package:flutter/material.dart';
import 'package:joke_app/views/widgets/two_taps.dart';
import 'package:joke_app/views/widgets/appbutton.dart';
import 'package:joke_app/views/widgets/stack_body.dart';
import 'package:joke_app/controller/appnetwork/network.dart';

class RandomView extends StatelessWidget {
  const RandomView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StackBody(
      twoTaps: TwoTaps(
        onPressedCopy: () {},
        onPressedFavorite: () {},
        color: Colors.grey,
      ),
      generateJoke: AppButton(
        onPressed: () => AppNetwork.networkState(context),
      ),
    );
  }
}
