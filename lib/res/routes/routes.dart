import 'package:get/get.dart';
import 'package:nutritionist/res/routes/controller/contact.binding.dart';
import 'package:nutritionist/res/routes/controller/home.binding.dart';
import 'package:nutritionist/screens/view/contact/contact.view.dart';
import 'package:nutritionist/screens/view/home/home_view.dart';

import '../../screens/view/about/about.view.dart';
import '../../screens/view/blog/blog.view.dart';
import '../../screens/view/pricing/pricing.view.dart';
import '../../screens/view/process/process.view.dart';
import '../../screens/view/team/team.view.dart';
import 'controller/about.binding.dart';
import 'controller/blog.binding.dart';
import 'controller/pricing.binding.dart';
import 'controller/process.binding.dart';
import 'controller/team.binding.dart';
import 'route.name.dart';

class Nav {
  static List<GetPage> routes = [
    GetPage(
        name: Routes.HOME,
        page: () => HomeView(),
        binding: HomeControllerBinding()),
    GetPage(
      name: Routes.ABOUT,
      page: () => AboutView(),
      binding: AboutControllerBinding(),
    ),
    GetPage(
      name: Routes.TEAM,
      page: () => TeamView(),
      binding: TeamControllerBinding(),
    ),
    GetPage(
      name: Routes.PROCESS,
      page: () => ProcessView(),
      binding: ProcessControllerBinding(),
    ),
    GetPage(
      name: Routes.PRICING,
      page: () => PricingView(),
      binding: PricingControllerBinding(),
    ),
    GetPage(
      name: Routes.BLOG,
      page: () => BlogView(),
      binding: BlogControllerBinding(),
    ),
    GetPage(
      name: Routes.CONTACT,
      page: () => ContactView(),
      binding: ContactControllerBinding(),
    ),
    /*
    GetPage(
      name: Routes.TEST,
      page: () => TestScreen(),
      binding: TestControllerBinding(),
    ),
*/
  ];
}
