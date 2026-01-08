import 'package:flutter/material.dart';
import 'NavigationConfig.dart';

class NavigationHelper {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static NavigatorState get _navigator => navigatorKey.currentState!;

  static Future<R?> push<T, R>(ScreenConfig<T> config, {required T data}) {
    return _navigator.push<R>(
      MaterialPageRoute(builder: (_) => config.builder(data)),
    );
  }

  static Future<R?> pushReplace<T, R>(
    ScreenConfig<T> config, {
    required T data,
  }) {
    return _navigator.pushReplacement<R, R>(
      MaterialPageRoute(builder: (_) => config.builder(data)),
    );
  }

  static Future<R?> pushAndClear<T, R>(
    ScreenConfig<T> config, {
    required T data,
  }) {
    return _navigator.pushAndRemoveUntil<R>(
      MaterialPageRoute(builder: (_) => config.builder(data)),
      (route) => false,
    );
  }

  static void pop<R>({R? result}) {
    _navigator.pop(result);
  }

  static bool canPop() => _navigator.canPop();
}
