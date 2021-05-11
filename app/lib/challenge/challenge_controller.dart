//CurrentPage

import 'package:flutter/foundation.dart';

class ChallengeController{
  final currentPAgeNoetifier = ValueNotifier<int>(1);
  int get currentPage => currentPAgeNoetifier.value;
  set currentPage(int value) => currentPAgeNoetifier.value = value;

  int qtdAnwserRight = 0;
}