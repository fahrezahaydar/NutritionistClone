import 'package:get/get.dart';
import 'package:nutritionist/screens/controller/contact.view.model.dart';

class ContactControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ContactController>(
      () => ContactController(),
    );
  }
}
