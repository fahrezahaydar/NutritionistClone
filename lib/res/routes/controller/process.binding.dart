import 'package:get/get.dart';
import 'package:nutritionist/screens/controller/process.view.model.dart';

class ProcessControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProcessController>(
      () => ProcessController(),
    );
  }
}
