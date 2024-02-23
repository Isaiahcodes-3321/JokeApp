import 'package:flutter/material.dart';
import 'package:joke_app/views/widgets/two_taps.dart';
import 'package:joke_app/views/widgets/appbutton.dart';
import 'package:joke_app/views/widgets/stack_body.dart';

class RandomView extends StatelessWidget {
  const RandomView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StackBody(
      twoTaps: TwoTaps(
        onPressed: () {},
      ),
      generateJoke: AppButton(
        onPressed: () {},
      ),
    );
  }
}
