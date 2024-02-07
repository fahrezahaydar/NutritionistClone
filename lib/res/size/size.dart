export 'details/padding.dart';
export 'details/custom.size.dart';
export 'details/size.partner.dart';
import 'package:get/get.dart';
import 'package:responsive_framework/responsive_framework.dart';

final isMobileTablet =
    ResponsiveBreakpoints.of(Get.context!).smallerOrEqualTo(TABLET);
