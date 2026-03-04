import 'package:flutter_riverpod/flutter_riverpod.dart';

final singleJokeP = StateProvider((ref) => '');
final setUpP = StateProvider((ref) => '');
final deliveryP = StateProvider((ref) => '');
final isLoading = StateProvider((ref) => '');
final isFavoriteClick = StateProvider((ref) => false);


var refProvider;
