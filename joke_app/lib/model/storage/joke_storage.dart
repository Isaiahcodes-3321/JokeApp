import 'package:hive/hive.dart';
part 'joke_storage.g.dart';

@HiveType(typeId: 1)
class JokeStorage {
  JokeStorage({required this.jokeStored,});

  @HiveField(0)
  String jokeStored;
}

// flutter packages pub run build_runner build
