import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProcessController extends GetxController {
  //TODO: Implement HomeController

  ScrollController scrollController = ScrollController();

  RxInt mobileCount = 0.obs;

  void next(int max) {
    if (mobileCount.value < max - 1) {
      mobileCount.value++;
    }
  }

  void prev() {
    if (mobileCount.value != 0) {
      mobileCount.value--;
    }
  }
}
