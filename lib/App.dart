import 'package:brainbox_ai/Helpers/AppConstants/AppConstants.dart';
import 'package:brainbox_ai/Helpers/Navigations/NavigationConfig.dart';
import 'package:brainbox_ai/Helpers/Navigations/NavigationHelper.dart';
import 'package:brainbox_ai/Helpers/ResponsiveUI.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    ResponsiveUI(
      context,
      figmaWidth: Appconstants.baseWidth,
      figmaHeight: Appconstants.baseHeight,
    );

    return MaterialApp(
      title: "Brainbox AI",
      navigatorKey: NavigationHelper.navigatorKey,
      debugShowCheckedModeBanner: false,
      onGenerateRoute: (settings) => MaterialPageRoute(
        builder: (context) => NavigationConfig.rootScreen.builder(null),
      ),
    );
  }
}
