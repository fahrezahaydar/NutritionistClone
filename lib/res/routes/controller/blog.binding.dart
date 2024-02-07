import 'package:get/get.dart';
import 'package:nutritionist/screens/controller/blog.view.model.dart';

class BlogControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BlogController>(
      () => BlogController(),
    );
  }
}
