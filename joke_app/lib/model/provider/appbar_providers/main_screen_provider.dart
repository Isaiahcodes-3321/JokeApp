import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProviderAppBarStatus {
  static final randomJokes = StateProvider((ref) => true);
  static final spookyJokes = StateProvider((ref) => false);
  static final punJokes = StateProvider((ref) => false);
  static final darkJokes = StateProvider((ref) => false);
  static final miscellaneousJokes = StateProvider((ref) => false);
  static final programmingJokes = StateProvider((ref) => false);
  static final dadsJokes = StateProvider((ref) => false);
}
