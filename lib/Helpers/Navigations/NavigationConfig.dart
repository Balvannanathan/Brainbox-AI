import 'package:brainbox_ai/Pages/ChatScreen/ChatScreen.dart';
import 'package:flutter/material.dart';

/// ============================
/// 🔹 Screen Enum (Optional, for logging / analytics)
/// ============================

enum AppScreen { ChatScreen }

/// ============================
/// 🔹 Screen Config
/// ============================

class ScreenConfig {
  final AppScreen screen;
  final Widget Function(dynamic data) builder;

  const ScreenConfig({required this.screen, required this.builder});
}

/// ============================
/// 🔹 Navigation Config
/// ============================

class NavigationConfig {
  // static var splash = ScreenConfig(
  //   screen: AppScreen.SplashScreen,
  //   builder: (_) => SplashScreen(),
  // );

  // static var onboarding = ScreenConfig(
  //   screen: AppScreen.OnboardingScreeen,
  //   builder: (_) => OnboardingScreen(),
  // );

  // static var login = ScreenConfig(
  //   screen: AppScreen.LoginScreen,
  //   builder: (_) => LoginScreen(),
  // );

  // static var signup = ScreenConfig(
  //   screen: AppScreen.SignupScreen,
  //   builder: (_) => SignupScreen(),
  // );

  // static var forget = ScreenConfig(
  //   screen: AppScreen.ForgetPasswordScreen,
  //   builder: (_) => ForgetPasswordScreen(),
  // );

  //   static var home = ScreenConfig(
  //     screen: AppScreen.HomeScreen,
  //     builder: (_) => HomeScreen(),
  //   );

  static var chatScreen = ScreenConfig(
    screen: AppScreen.ChatScreen,
    builder: (_) => ChatScreen(),
  );
}
