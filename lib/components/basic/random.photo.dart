import 'package:cached_network_image/cached_network_image.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'logo.dart';

class Photos extends StatelessWidget {
  final double size;
  final Decoration? decoration;
  final String imageUrl;

  const Photos(
      {super.key, required this.size, this.decoration, required this.imageUrl});

  factory Photos.random({required double size, Decoration? decoration}) {
    return Photos(
        size: size,
        decoration: decoration,
        imageUrl: Faker().image.image(
              width: size.toInt(),
              height: size.toInt(),
              keywords: ["person"],
              random: true,
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      padding: EdgeInsets.zero,
      clipBehavior: Clip.hardEdge,
      decoration: decoration,
      child: CachedNetworkImage(
        imageUrl: Faker().image.image(
              width: size.toInt(),
              height: size.toInt(),
              keywords: ["person"],
              random: true,
            ),
        placeholder: (context, url) => const Padding(
          padding: EdgeInsets.all(10.0),
          child: CircularProgressIndicator(),
        ),
        errorWidget: (context, url, error) => const Icon(Icons.error),
      ),
    );
  }
}

class SquareLogo extends StatelessWidget {
  const SquareLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    final isMobile = ResponsiveBreakpoints.of(context).smallerOrEqualTo(MOBILE);
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: ShapeDecoration(
        gradient: LinearGradient(
          begin: const Alignment(0.00, 0.20),
          end: const Alignment(0, 1),
          colors: [color.secondaryContainer, color.background.withAlpha(0)],
        ),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: BorderSide(
              color: color.primary.withOpacity(0.2),
              width: 3,
            )),
      ),
      child: Image.asset(image('petal'),
          color: color.primary,
          fit: BoxFit.fitHeight,
          height: isMobile ? 30 : 40),
    );
  }
}
