import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/content/pricing.content.dart';

class PricingController extends GetxController {
  //TODO: Implement HomeController

  ScrollController scrollController = ScrollController();
  RxBool isMonthly = true.obs;

  List<RxBool> open = List.generate(faqData.length, (i) => false.obs);
}
