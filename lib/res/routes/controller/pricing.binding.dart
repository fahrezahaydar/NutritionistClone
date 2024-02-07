import 'package:get/get.dart';
import 'package:nutritionist/screens/controller/pricing.view.model.dart';

class PricingControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PricingController>(
      () => PricingController(),
    );
  }
}
