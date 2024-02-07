import 'package:flutter/material.dart';

String image(String path) => 'assets/png/$path.png';
String svgIcon(String path) => 'assets/svg/$path.svg';

class Logo extends StatelessWidget {
  final double? height;
  final Color? color;
  const Logo({
    this.height,
    super.key,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Image.asset(
        image('logo'),
        color: color,
      ),
    );
  }
}
