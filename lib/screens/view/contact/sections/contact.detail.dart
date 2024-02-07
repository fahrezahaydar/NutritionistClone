import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:nutritionist/components/basic/logo.dart';
import 'package:nutritionist/components/basic/text.dart';
import 'package:nutritionist/data/content/contact.content.dart';
import 'package:nutritionist/res/size/size.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../../../components/basic/column.row.dart';

class ContactDetail extends StatelessWidget {
  const ContactDetail({super.key});

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    final isMobileTablet =
        ResponsiveBreakpoints.of(context).smallerOrEqualTo(TABLET);
    return WebPaddingSymetric(
      horizontal: SizePartner.mainPadding,
      child: Container(
        decoration: BoxDecoration(
          color: color.primary.withOpacity(0.05),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: color.primary.withOpacity(0.1)),
        ),
        padding: const EdgeInsets.all(30),
        clipBehavior: Clip.hardEdge,
        child: ResponsiveRowColumn(
          layout: isMobileTablet
              ? ResponsiveRowColumnType.COLUMN
              : ResponsiveRowColumnType.ROW,
          rowSpacing: 40,
          columnSpacing: 20,
          rowCrossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ResponsiveRowColumnItem(
              rowFlex: 1,
              rowFit: FlexFit.tight,
              child: WebColumn(
                columnSpacing: 10,
                children: [
                  ResponsiveRowColumn(
                      layout: isMobileTablet
                          ? ResponsiveRowColumnType.COLUMN
                          : ResponsiveRowColumnType.ROW,
                      rowSpacing: 10,
                      columnSpacing: 10,
                      children: const [
                        ResponsiveRowColumnItem(
                          rowFlex: 1,
                          child: WebTextField(
                            subject: "Full Name",
                            hintText: "Enter your Name",
                          ),
                        ),
                        ResponsiveRowColumnItem(
                          rowFlex: 1,
                          child: WebTextField(
                            subject: "Email",
                            hintText: "Enter your Email",
                          ),
                        )
                      ]),
                  const WebTextField(
                    subject: "Phone Number",
                    hintText: "Enter your Number",
                  ),
                  const WebTextField(
                    subject: "Message",
                    hintText: "Enter your Message",
                    maxLength: 250,
                    maxLines: 4,
                  ),
                  FilledButton(
                    onPressed: () {},
                    style: FilledButton.styleFrom(
                        minimumSize: const Size.fromHeight(56)),
                    child: const WebText("Send Messages"),
                  )
                ],
              ),
            ),
            ResponsiveRowColumnItem(
                rowFlex: 1,
                rowFit: FlexFit.tight,
                child: WebColumn(
                  columnSpacing: 20,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: isMobileTablet ? context.width : context.width / 2,
                      height: 340,
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: SvgPicture.asset(
                        svgIcon("map"),
                        fit: BoxFit.cover,
                      ),
                    ),
                    WebRow(
                      mainAxisAlignment: MainAxisAlignment.end,
                      rowSpacing: 10,
                      children: List.generate(iconList.length, (index) {
                        return SocialButton(iconData: iconList[index]);
                      }),
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}

class WebTextField extends StatelessWidget {
  final String subject;
  final String hintText;
  final int maxLines;
  final int? maxLength;
  const WebTextField({
    super.key,
    required this.subject,
    required this.hintText,
    this.maxLines = 1,
    this.maxLength,
  });

  @override
  Widget build(BuildContext context) {
    return WebColumn(
      columnSpacing: 8,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        WebText(subject),
        TextField(
          decoration: InputDecoration(
            hintText: hintText,
          ),
          maxLength: maxLength,
          maxLines: maxLines,
        ),
      ],
    );
  }
}

class SocialButton extends StatelessWidget {
  const SocialButton({
    super.key,
    required this.iconData,
  });

  final String iconData;

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    return Container(
      width: 56,
      height: 56,
      decoration: BoxDecoration(
        color: color.primary,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.all(16),
      child: SvgPicture.asset(
        svgIcon(iconData),
        colorFilter: ColorFilter.mode(color.background, BlendMode.srcIn),
      ),
    );
  }
}
