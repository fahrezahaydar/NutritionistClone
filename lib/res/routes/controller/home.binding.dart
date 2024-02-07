import 'package:get/get.dart';
import 'package:nutritionist/screens/controller/home.view.model.dart';

class HomeControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
  }
}
