import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'model/storage/joke_storage.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:joke_app/views/approute/route.dart';
import 'package:joke_app/views/constant/constant.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupHive();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  runApp(const MyApp());
}

// setting up hive
Future<void> setupHive() async {
  await Hive.initFlutter();
  Hive.registerAdapter(JokeStorageAdapter());
  jokeStorage = await Hive.openBox<JokeStorage>('JokeStorage');
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return ProviderScope(  
          child: MaterialApp.router(
            debugShowCheckedModeBanner: false,
            routerConfig: AppRoute.router,
          ),
        );
      },
    );
  }
}
