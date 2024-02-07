import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nutritionist/components/appbar.dart';
import 'package:nutritionist/components/drawer.dart';
import 'package:nutritionist/components/footer.dart';

import 'package:nutritionist/screens/controller/home.view.model.dart';
import 'package:nutritionist/utils/spacer.dart';

import '../../../res/size/size.dart';

import 'sections/pricing.dart';
import 'sections/hero.dart';
import 'sections/testimonial.dart';
import 'sections/feature.dart';
import 'sections/blog.dart';

class HomeView extends GetView<HomeController> {
  HomeView({super.key});
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: SingleChildScrollView(
        controller: controller.scrollController,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const ResponsiveBox(height: [180, 160], child: WebAppBar()),
            const HeroSection(),
            const FeaturesSection(),
            const BlogSection(),
            const TestimonialSection(),
            const PricingSection(),
            VerticalSpace(isMobileTablet ? 20 : 80),
            Footer(controller.scrollController)
          ],
        ),
      ),
      endDrawer: const CustomDrawer(),
    );
  }
}
