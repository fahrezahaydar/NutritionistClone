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
import '../../../data/content/blog.content.dart';
import '../../controller/blog.view.model.dart';
import 'sections/blog.hero.dart';
import 'sections/blog.menu.dart';

class BlogView extends GetView<BlogController> {
  BlogView({super.key});
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
            const BlogHeroSections(),
            const BlogMenuSections(),
            const VerticalSpace(60),
            Footer(controller.scrollController)
          ],
        ),
      ),
      endDrawer: const CustomDrawer(),
    );
  }
}
