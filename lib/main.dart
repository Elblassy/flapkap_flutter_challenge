import 'package:flapkap_flutter_challenge/utils/rout_generator.dart';
import 'package:flapkap_flutter_challenge/utils/tools.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_strategy/url_strategy.dart';

void main() {
  setPathUrlStrategy();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: isMobile() ? const Size(640, 1136) : const Size(1680, 1050),
      builder: () => MaterialApp(
        debugShowCheckedModeBanner: false,
        navigatorKey: navKey,
        onGenerateRoute: RouteGenerator.generateRoute,
        title: 'FlapKap',
        theme: ThemeData.light().copyWith(
          scaffoldBackgroundColor: bgColor,
          canvasColor: secondaryColor,
        ),
      ),
    );
  }
}
