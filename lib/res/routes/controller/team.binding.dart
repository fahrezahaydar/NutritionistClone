import 'package:get/get.dart';
import 'package:nutritionist/screens/controller/team.view.model.dart';

class TeamControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TeamController>(
      () => TeamController(),
    );
  }
}
