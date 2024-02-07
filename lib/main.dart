import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:nutritionist/res/routes/route.name.dart';
import 'package:nutritionist/res/routes/routes.dart';
import 'package:nutritionist/res/theme/theme.dart';
import 'package:nutritionist/utils/scrol.dart';
import 'package:responsive_framework/responsive_framework.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  var initialRoute = await Routes.initialRoute;
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(DevicePreview(
      enabled: true,
      builder: (context) => MyApp(initialRoute),
    ));
  });
}

class MyApp extends StatelessWidget {
  final String? initialRoute;
  const MyApp(this.initialRoute, {super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Nutritionist : ${routes.capitalizeFirst}',
      getPages: Nav.routes,
      initialRoute: initialRoute,
      debugShowCheckedModeBanner: false,
      scrollBehavior: MyCustomScrollBehavior(),
      locale: DevicePreview.locale(context),
      theme: WebTheme.light,
      darkTheme: WebTheme.dark,
      themeMode: ThemeMode.system,
      builder: (context, child) => ResponsiveBreakpoints.builder(
        child: DevicePreview.appBuilder(context, child),
        breakpoints: [
          const Breakpoint(start: 0, end: 401, name: "MINI"),
          const Breakpoint(start: 402, end: 600, name: MOBILE),
          const Breakpoint(start: 601, end: 1024, name: TABLET),
          const Breakpoint(start: 1025, end: 1440, name: DESKTOP),
          const Breakpoint(start: 1441, end: 1920, name: '2K'),
          const Breakpoint(start: 1920, end: double.infinity, name: '4K'),
        ],
      ),
    );
  }
}

String get routes {
  String data = Get.currentRoute;
  String output;
  if (data == "/") {
    return "home";
  } else {
    if (data.isNotEmpty) {
      output = data.substring(1);
      return output;
    } else {
      return data;
    }
  }
}
