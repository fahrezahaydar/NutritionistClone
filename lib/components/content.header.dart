import 'package:flutter/material.dart';
import 'package:nutritionist/components/basic/text.dart';
import 'package:nutritionist/res/size/size.dart';
import 'package:nutritionist/utils/spacer.dart';

class ContentHeader extends StatelessWidget {
  final Map<String, String> header;
  const ContentHeader({
    super.key,
    required this.header,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        WebText.bold(
          header["title"]!,
          fontSize: const SizePartner(28, 36),
          textAlign: TextAlign.center,
        ),
        const VerticalSpace(20),
        WebText(header["subtitle"]!, textAlign: TextAlign.center),
      ],
    );
  }
}
