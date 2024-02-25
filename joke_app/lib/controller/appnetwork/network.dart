import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class AppNetwork {
  static networkState(BuildContext context) async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('No internet connection'),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }
}
