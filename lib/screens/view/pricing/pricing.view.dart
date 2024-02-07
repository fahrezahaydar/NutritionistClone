// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nutritionist/res/size/size.dart';
import 'package:nutritionist/utils/spacer.dart';

import '../../../components/appbar.dart';
import '../../../components/basic/logo.dart';
import '../../../components/content/cta.dart';
import '../../../components/drawer.dart';
import '../../../components/footer.dart';
import '../../../data/content/pricing.content.dart';
import '../../controller/pricing.view.model.dart';
import 'sections/pricing.detail.dart';
import 'sections/pricing.faq.dart';
import 'sections/pricing.feature.dart';
import 'sections/pricing.hero.dart';

class PricingView extends GetView<PricingController> {
  PricingView({super.key});
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
            const PricingHero(),
            const PricingDetailSection(),
            const FeaturesSection(),
            const PricingFAQSection(),
            Footer(controller.scrollController)
          ],
        ),
      ),
      endDrawer: const CustomDrawer(),
    );
  }
}
