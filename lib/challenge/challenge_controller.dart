import 'package:flutter/material.dart';

class ChallengeController {
  final currentPageNotifier = ValueNotifier<int>(0);
  set currentPage(int page) => currentPageNotifier.value = page;
  int get currentPage => currentPageNotifier.value;

  int qtdAcertos = 0;
}
