import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nutritionist/components/basic/logo.dart';
import 'package:nutritionist/components/basic/text.dart';
import 'package:nutritionist/res/routes/route.name.dart';
import 'package:nutritionist/res/size/details/size.partner.dart';

import 'package:nutritionist/utils/spacer.dart';
import 'package:responsive_framework/responsive_framework.dart';

List<String> menu = ["Home", "About", "Team", "Process", "Pricing", "Blog"];

String routes(String item) {
  if (item == 'Home') {
    return "/";
  } else {
    return "/${item.toLowerCase()}";
  }
}

class WebAppBar extends StatelessWidget {
  const WebAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobileTablet =
        ResponsiveBreakpoints.of(context).smallerOrEqualTo(TABLET);
    final isMobile = ResponsiveBreakpoints.of(context).smallerThan(TABLET);
    final color = Theme.of(context).colorScheme;

    return Column(
      children: [
        const Expanded(
          child: Banner(),
        ),
        Container(
          height: 80,
          width: context.width,
          color: color.primary,
          padding: EdgeInsets.symmetric(horizontal: isMobile ? 16 : 80),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Logo(color: color.background),
              ...isMobileTablet
                  ? [
                      Builder(
                        builder: (BuildContext context) {
                          return IconButton(
                            icon: Icon(Icons.menu, color: color.background),
                            onPressed: () {
                              Scaffold.of(context).openEndDrawer();
                            },
                          );
                        },
                      )
                    ]
                  : [
                      Row(
                        children: [
                          ...menu.map((item) {
                            return TextButton(
                              onPressed: () => Get.toNamed(routes(item)),
                              style: TextButton.styleFrom(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                                fixedSize: const Size.fromHeight(48),
                                backgroundColor:
                                    routes(item) != Get.currentRoute
                                        ? color.primary
                                        : color.background.withOpacity(0.1),
                                foregroundColor: color.background,
                              ),
                              child: WebText(item,
                                  fontSize: const SizePartner(14, 14),
                                  fontWeight: routes(item) != Get.currentRoute
                                      ? FontWeight.w500
                                      : FontWeight.w800),
                            );
                          }),
                          const HorizontalSpace(20),
                          ElevatedButton(
                              onPressed: () => Get.toNamed(Routes.CONTACT),
                              child: const Text('Contact Us')),
                        ],
                      )
                    ],
            ],
          ),
        ),
      ],
    );
  }
}

class Banner extends StatelessWidget {
  const Banner({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    bool isMini = ResponsiveBreakpoints.of(context).equals("MINI");
    final color = Theme.of(context).colorScheme;
    final isMobile = ResponsiveBreakpoints.of(context).smallerThan(TABLET);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: isMobile ? 16 : 80),
      width: context.width,
      color: Theme.of(context).colorScheme.primary,
      alignment: Alignment.center,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: color.background.withOpacity(0.08),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.sports_baseball, color: color.background, size: 20),
            const HorizontalSpace(10),
            WebText(
              'Join Our Personalized${isMini ? '\n' : ' '}Nutrition Demo For Free',
              maxLines: 2,
              textAlign: TextAlign.center,
              color: color.background,
            ),
            const HorizontalSpace(10),
            Icon(Icons.arrow_forward, color: color.background, size: 20)
          ],
        ),
      ),
    );
  }
}
