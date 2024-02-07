// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nutritionist/res/size/size.dart';
import 'package:nutritionist/components/content/cta.dart';
import 'package:nutritionist/screens/view/about/sections/story.dart';

import '../../../components/appbar.dart';
import '../../../components/basic/logo.dart';
import '../../../components/drawer.dart';
import '../../../components/footer.dart';

import '../../../data/content/about.content.dart';
import '../../controller/about.view.model.dart';
import 'sections/achievement.dart';
import 'sections/text.header.dart';

class AboutView extends GetView<AboutController> {
  AboutView({super.key});
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
            WebPaddingAll(
              padding: SizePartner.mainPadding,
              child: Image.asset(
                image("about-hero"),
                width: context.width,
                fit: BoxFit.fitWidth,
              ),
            ),
            const TextSection(),
            const StorySection(),
            const AchievementSection(),
            CTASection(
              data: cta,
              onPressed: () {},
            ),
            Footer(controller.scrollController)
          ],
        ),
      ),
      endDrawer: const CustomDrawer(),
    );
  }
}
