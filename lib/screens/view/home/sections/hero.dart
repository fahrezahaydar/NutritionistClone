import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nutritionist/components/basic/logo.dart';
import 'package:nutritionist/components/basic/random.photo.dart';
import 'package:nutritionist/data/content/home.content.dart';
import 'package:nutritionist/res/size/size.dart';
import 'package:nutritionist/utils/spacer.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../../../components/basic/text.dart';
import '../../../../components/basic/images.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobileTablet =
        ResponsiveBreakpoints.of(context).smallerOrEqualTo(TABLET);
    final isMobile = ResponsiveBreakpoints.of(context).smallerOrEqualTo(MOBILE);
    return ResponsiveRowColumn(
      layout: isMobileTablet
          ? ResponsiveRowColumnType.COLUMN
          : ResponsiveRowColumnType.ROW,
      columnSpacing: 20,
      children: [
        ResponsiveRowColumnItem(
          rowFlex: 3,
          child: ResponsiveBox(
            height: [
              5 / 14 * context.width,
              1 / 2 * context.width + 30,
              context.width + 30
            ],
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                Images(
                  image('homepage-hero'),
                  fit: BoxFit.cover,
                  mobile: Size.fromHeight(context.width),
                  tablet: Size.fromHeight(1 / 2 * context.width),
                  desktop: Size.fromHeight(5 / 14 * context.width),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomRight: const Radius.circular(90),
                        bottomLeft: isMobileTablet
                            ? const Radius.circular(90)
                            : Radius.zero),
                  ),
                ),
                ResponsiveVisibility(
                  visible: isMobileTablet,
                  child: const Positioned(
                    bottom: 0,
                    child: ThreeCircle(),
                  ),
                ),
              ],
            ),
          ),
        ),
        ResponsiveRowColumnItem(
          child: ResponsiveVisibility(
            visible: isMobileTablet,
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                WebText("430+",
                    fontWeight: FontWeight.w800, fontSize: SizePartner(16, 18)),
                HorizontalSpace(5),
                WebText("Happy Customer", fontSize: SizePartner(16, 18))
              ],
            ),
          ),
        ),
        ResponsiveRowColumnItem(
            rowFlex: 4,
            child: Padding(
              padding: !isMobileTablet
                  ? const EdgeInsets.only(left: 40.0, right: 80)
                  : isMobile
                      ? const EdgeInsets.symmetric(horizontal: 20)
                      : const EdgeInsets.symmetric(horizontal: 80),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const HeroContent(),
                  ResponsiveVisibility(
                      visible: !isMobileTablet, child: const VerticalSpace(40)),
                  ResponsiveVisibility(
                    visible: !isMobileTablet,
                    child: const Row(
                      children: [
                        ThreeCircle(),
                        HorizontalSpace(20),
                        WebText(
                          "430+",
                          fontWeight: FontWeight.w800,
                          fontSize: SizePartner(16, 18),
                        ),
                        HorizontalSpace(5),
                        WebText("Happy Customer", fontSize: SizePartner(16, 18))
                      ],
                    ),
                  ),
                ],
              ),
            )),
      ],
    );
  }
}

class HeroContent extends StatelessWidget {
  const HeroContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isMobileTablet =
        ResponsiveBreakpoints.of(context).smallerOrEqualTo(TABLET);
    final color = Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment:
          isMobileTablet ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        Container(
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(
              color: color.primary,
              width: 3,
            ))),
            child: WebText.bold(heroSubtitle)),
        const VerticalSpace(10),
        WebText.bold(
          heroTitle,
          textAlign: isMobileTablet ? TextAlign.center : TextAlign.left,
          fontSize: const SizePartner(36, 48),
        ),
        const VerticalSpace(10),
        WebText(
          heroBody,
          textAlign: isMobileTablet ? TextAlign.center : TextAlign.left,
        ),
        const VerticalSpace(20),
        Row(
          mainAxisAlignment: isMobileTablet
              ? MainAxisAlignment.center
              : MainAxisAlignment.start,
          children: [
            FilledButton(
                onPressed: () {},
                style: FilledButton.styleFrom(
                    foregroundColor: Theme.of(context).colorScheme.background),
                child: const Text('Get Starter Today')),
            const HorizontalSpace(10),
            OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(side: BorderSide.none),
                child: const Text('Book a Demo')),
          ],
        ),
      ],
    );
  }
}

class ThreeCircle extends StatelessWidget {
  const ThreeCircle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110,
      height: 58,
      padding: const EdgeInsets.all(8),
      decoration: ShapeDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        shape: RoundedRectangleBorder(
          side: BorderSide(
              width: 1, color: Theme.of(context).colorScheme.primary),
          borderRadius: BorderRadius.circular(90),
        ),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
              left: 0,
              child: Photos.random(
                  size: 40,
                  decoration: const ShapeDecoration(shape: CircleBorder()))),
          Positioned(
              left: 25,
              child: Photos.random(
                  size: 40,
                  decoration: ShapeDecoration(shape: CircleBorder()))),
          Positioned(
              left: 50,
              child: Photos.random(
                  size: 40,
                  decoration: ShapeDecoration(shape: CircleBorder()))),
        ],
      ),
    );
  }
}
