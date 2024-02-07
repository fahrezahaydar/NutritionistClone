import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nutritionist/components/basic/logo.dart';

import 'package:nutritionist/utils/spacer.dart';

import '../res/routes/route.name.dart';

List<String> menu = ["Home", "About", "Team", "Process", "Pricing", "Blog"];

String routes(String item) {
  if (item == 'Home') {
    return "/";
  } else {
    return "/${item.toLowerCase()}";
  }
}

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
        width: 4 / 5 * Get.context!.width,
        backgroundColor: Theme.of(context).colorScheme.primary,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const VerticalSpace(80),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Logo(color: Theme.of(context).colorScheme.background),
              ),
              ...menu.map((item) {
                String data = routes(item);
                return TextButton(
                  onPressed: () => Get.toNamed(routes(item)),
                  style: FilledButton.styleFrom(
                    padding: const EdgeInsets.all(10),
                    fixedSize: Size(context.width, 48),
                    backgroundColor: Colors.transparent,
                  ),
                  child: Text(
                    item,
                    style: GoogleFonts.urbanist(
                        fontSize: 14,
                        color: Theme.of(context).colorScheme.background,
                        fontWeight: data != Get.currentRoute
                            ? FontWeight.w500
                            : FontWeight.w800),
                  ),
                );
              }),
              const VerticalSpace(20),
              ElevatedButton(
                  onPressed: () => Get.toNamed(Routes.CONTACT),
                  child: const Text(
                    'Contact Us',
                  )),
            ],
          ),
        ));
  }
}
