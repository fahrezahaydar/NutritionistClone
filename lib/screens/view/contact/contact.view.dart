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
import '../../../data/content/contact.content.dart';
import '../../controller/contact.view.model.dart';
import 'sections/contact.detail.dart';
import 'sections/contact.hero.dart';

class ContactView extends GetView<ContactController> {
  ContactView({super.key});
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
            const ContactHero(),
            const ContactDetail(),
            CTASection(
              data: contactCTA,
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
