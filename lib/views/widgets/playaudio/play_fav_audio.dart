import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

enum TtsState { playing, stopped }

class PlayFavoriteAudio extends ConsumerStatefulWidget {
  const PlayFavoriteAudio({Key? key}) : super(key: key);

  @override
  ConsumerState<PlayFavoriteAudio> createState() => PlayAudioState();
}

class PlayAudioState extends ConsumerState<PlayFavoriteAudio> {
  final FlutterTts _flutterTts = FlutterTts();
  TtsState ttsState = TtsState.stopped;

  @override
  void initState() {
    super.initState();
    _flutterTts.setCompletionHandler(
        () => setState(() => ttsState = TtsState.stopped));
    _flutterTts.setCancelHandler(
        () => setState(() => ttsState = TtsState.stopped));
    _flutterTts.setErrorHandler(
        (msg) => setState(() => ttsState = TtsState.stopped));
    _flutterTts.setLanguage("en-US");
    _flutterTts.setSpeechRate(0.5);
    _flutterTts.setVolume(1.0);
    _flutterTts.setPitch(0.7);
  }

  @override
  void dispose() {
    _flutterTts.stop();
    super.dispose();
  }

  Future<void> playText(String text) async {
    await _stop();
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
    return Icon(
      isPlaying ? Icons.volume_up_outlined : Icons.volume_off_outlined,
      color: isPlaying ? Colors.green : Colors.black,
      size: 24.sp,
    );
  }
}