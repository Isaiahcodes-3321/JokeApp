import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Toast {
  static successToast(String message) {
    JokeAppToast.showToast(
      child: JokeAppToast.successToast(message),
    );
  }

  static errorToast(String message) {
    JokeAppToast.showToast(
      child: JokeAppToast.errorToast(message),
    );
  }
}

class JokeAppToast {
  static final FToast _fToast = FToast();

  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static void init() {
    final context = navigatorKey.currentContext;
    if (context != null) {
      _fToast.init(context);
    }
  }

  static void showToast({required Widget child}) {
    init(); 
    _fToast.showToast(
      child: child,
      gravity: ToastGravity.TOP,
      toastDuration: const Duration(seconds: 4),
      fadeDuration: const Duration(milliseconds: 300),
    );
  }

  static Widget errorToast(String message) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      decoration: BoxDecoration(
        color: Colors.red.shade500,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.warning, color: Colors.white),
          const SizedBox(width: 12),
          Text(
            message,
            style: const TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }

  static Widget successToast(String message) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      decoration: BoxDecoration(
        color: Colors.green.shade500,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.check_circle, color: Colors.white),
          const SizedBox(width: 12),
          Text(
            message,
            style: const TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}



// Future _speak() async{
//     var result = await flutterTts.speak("Hello World");
//     if (result == 1) setState(() => ttsState = TtsState.playing);
// }