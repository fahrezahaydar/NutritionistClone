import 'package:get/get.dart';
import 'package:nutritionist/screens/controller/about.view.model.dart';

class AboutControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AboutController>(
      () => AboutController(),
    );
  }
}
