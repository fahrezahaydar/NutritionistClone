import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nutritionist/components/basic/column.row.dart';
import 'package:nutritionist/components/basic/text.dart';
import 'package:nutritionist/res/size/size.dart';
import 'package:nutritionist/utils/spacer.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'basic/logo.dart';

class Footer extends StatelessWidget {
  final ScrollController? controller;

  const Footer(this.controller, {super.key});

  @override
  Widget build(BuildContext context) {
    final isMobileTablet =
        ResponsiveBreakpoints.of(context).smallerOrEqualTo(TABLET);
    final isMobile = ResponsiveBreakpoints.of(context).smallerThan(TABLET);
    final color = Theme.of(context).colorScheme;
    return Container(
      color: color.primary,
      padding: EdgeInsets.symmetric(
          horizontal: isMobile ? 20 : 80, vertical: isMobile ? 20 : 40),
      child: WebColumn(
        columnSpacing: 20,
        children: [
          Row(
            children: [
              Logo(color: color.background, height: isMobile ? 36 : 48),
              const Spacer(),
              if (!isMobileTablet)
                ...menu.map((item) {
                  return TextButton(
                    onPressed: () {},
                    style:
                        TextButton.styleFrom(foregroundColor: color.background),
                    child: WebText(item,
                        fontWeight: routes(item) != Get.currentRoute
                            ? FontWeight.w500
                            : FontWeight.w800),
                  );
                }),
              const Spacer(),
              TextButton(
                  onPressed: () {
                    controller!.animateTo(
                      0.0,
                      duration: const Duration(seconds: 1),
                      curve: Curves.easeInOut,
                    );
                  },
                  child: Row(
                    children: [
                      WebText("Go to Top", color: color.background),
                      const HorizontalSpace(10),
                      Container(
                        height: 48,
                        width: 48,
                        decoration: BoxDecoration(
                          color: color.background.withOpacity(0.1),
                          shape: BoxShape.circle,
                        ),
                        alignment: Alignment.center,
                        child: Icon(
                          Icons.arrow_upward_rounded,
                          color: color.background,
                          size: 24,
                        ),
                      )
                    ],
                  ))
            ],
          ),
          ResponsiveVisibility(
              visible: isMobileTablet,
              child: Wrap(
                alignment: WrapAlignment.center,
                children: [
                  ...menu.map((item) {
                    return TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                          foregroundColor: color.background),
                      child: WebText(item,
                          fontWeight: routes(item) != Get.currentRoute
                              ? FontWeight.w500
                              : FontWeight.w800),
                    );
                  }),
                ],
              )),
          Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: color.background.withOpacity(0.05)),
              child: ResponsiveRowColumn(
                layout: isMobileTablet
                    ? ResponsiveRowColumnType.COLUMN
                    : ResponsiveRowColumnType.ROW,
                columnSpacing: 20,
                rowSpacing: 20,
                children: [
                  ...List.generate(
                    3,
                    (i) => const ResponsiveRowColumnItem(
                      child:
                          Contact(icon: Icons.mail, data: 'hello@squareup.com'),
                    ),
                  ),
                  ResponsiveRowColumnItem(
                      rowFit: FlexFit.tight,
                      child: Container(
                        alignment: isMobileTablet
                            ? Alignment.center
                            : Alignment.centerRight,
                        child: WebText(
                          '© 2023 Nutritionist. All rights reserved.',
                          color: color.background,
                        ),
                      )),
                ],
              ))
        ],
      ),
    );
  }
}

List<String> menu = ["Home", "About", "Team", "Process", "Pricing", "Blog"];

String routes(String item) {
  if (item == 'Home') {
    return "/";
  } else {
    return "/${item.toLowerCase()}";
  }
}

class Contact extends StatelessWidget {
  final IconData icon;
  final String data;
  const Contact({
    required this.icon,
    required this.data,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;

    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: color.background.withOpacity(0.1))),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: color.background),
          const HorizontalSpace(10),
          WebText(
            data,
            overflow: TextOverflow.ellipsis,
            fontSize: const SizePartner(16, 16),
            color: color.background,
          )
        ],
      ),
    );
  }
}
