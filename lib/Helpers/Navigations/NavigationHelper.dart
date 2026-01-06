import 'package:flutter/material.dart';
import 'NavigationConfig.dart';

class NavigationHelper {

  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static NavigatorState get _navigator => navigatorKey.currentState!;

  static Future<T?> push<T>(ScreenConfig config, {dynamic data}) {
    return _navigator.push<T>(
      MaterialPageRoute(builder: (_) => config.builder(data)),
    );
  }

  static Future<T?> pushReplace<T>(ScreenConfig config, {dynamic data}) {
    return _navigator.pushReplacement<T, T>(
      MaterialPageRoute(builder: (_) => config.builder(data)),
    );
  }

  static Future<T?> pushAndClear<T>(ScreenConfig config, {dynamic data}) {
    return _navigator.pushAndRemoveUntil<T>(
      MaterialPageRoute(builder: (_) => config.builder(data)),
      (route) => false,
    );
  }

  static void pop<T>({T? result}) {
    _navigator.pop(result);
  }

  static bool canPop() => _navigator.canPop();
}
