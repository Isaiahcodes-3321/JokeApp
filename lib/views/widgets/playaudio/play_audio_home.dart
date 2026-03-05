import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:joke_app/services/provider/joke_provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:flutter_tts/flutter_tts.dart';

enum TtsState { playing, stopped }

class PlayAudio extends ConsumerStatefulWidget {
  const PlayAudio({Key? key}) : super(key: key);

  @override
  ConsumerState<PlayAudio> createState() => _PlayAudioState();
}

class _PlayAudioState extends ConsumerState<PlayAudio> {
  final FlutterTts _flutterTts = FlutterTts();
  TtsState ttsState = TtsState.stopped;

  @override
  void initState() {
    super.initState();
    _flutterTts.setCompletionHandler(() {
      setState(() => ttsState = TtsState.stopped);
    });
    _flutterTts.setCancelHandler(() {
      setState(() => ttsState = TtsState.stopped);
    });
    _flutterTts.setErrorHandler((msg) {
      setState(() => ttsState = TtsState.stopped);
    });
    _flutterTts.setLanguage("en-US");
    // speach speed reading
    _flutterTts.setSpeechRate(0.5);
    _flutterTts.setVolume(1.0);
    // chnage voice thinkness
    _flutterTts.setPitch(0.7);
  }

  @override
  void dispose() {
    _flutterTts.stop();
    super.dispose();
  }

  String _getFullJokeText() {
    String jokeText = ref.read(singleJokeP);
    String setUpText = ref.read(setUpP);
    String deliveryText = ref.read(deliveryP);
    return '$jokeText $setUpText $deliveryText';
  }

  Future<void> _speak() async {
    String text = _getFullJokeText();
    var result = await _flutterTts.speak(text);
    if (result == 1) setState(() => ttsState = TtsState.playing);
  }

  Future<void> _stop() async {
    var result = await _flutterTts.stop();
    if (result == 1) setState(() => ttsState = TtsState.stopped);
  }

  @override
  Widget build(BuildContext context) {
    bool isPlaying = ttsState == TtsState.playing;

    return GestureDetector(
      onTap: () {
        if (isPlaying) {
          _stop();
        } else {
          _speak();
        }
      },
      child: Icon(
        isPlaying ? Icons.volume_up_outlined : Icons.volume_off_outlined,
        color: isPlaying ? Colors.green : Colors.black,
        size: 24.sp,
      ),
    );
  }
}
