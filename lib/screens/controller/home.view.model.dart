import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  final count = 0.obs;
  final device = ''.obs;

  List<RxBool> fav = List.generate(4, (index) => RxBool(false));
  List<RxBool> bmark = List.generate(4, (index) => RxBool(false));

  final nav = 0.obs;
  ScrollController scrollController = ScrollController();

  void minus() {
    if (nav.value > 0) {
      nav.value--;
    }
  }

  void plus(int max) {
    if (nav.value < max - 1) {
      nav.value++;
    }
  }

  RxBool isMonthly = true.obs;
}
