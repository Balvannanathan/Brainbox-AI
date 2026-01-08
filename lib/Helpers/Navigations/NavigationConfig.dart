import 'package:brainbox_ai/Pages/AiAssistantScreen/AiAssistantScreen.dart';
import 'package:brainbox_ai/Pages/ChatScreen/ChatScreen.dart';
import 'package:brainbox_ai/Pages/EditProfileScreen/EditProfileScreen.dart';
import 'package:brainbox_ai/Pages/HistoryScreen/HistoryScreen.dart';
import 'package:brainbox_ai/Pages/HomeScreen/HomeScreen.dart';
import 'package:brainbox_ai/Pages/PreferencesScreen/PreferencesScreen.dart';
import 'package:brainbox_ai/Pages/ProfileScreen/ProfileScreen.dart';
import 'package:brainbox_ai/Pages/RootScreen/RootScreen.dart';
import 'package:flutter/material.dart';

/// ============================
/// 🔹 Screen Enum (Optional, for logging / analytics)
/// ============================

enum AppScreen {
  HistoryScreen,
  ProfileScreen,
  AiAssistantScreen,
  RootScreen,
  PreferenceScreen,
  HomeScreen,
  EditProfileScreen,
  ChatScreen,
}

typedef ScreenBuilder<T> = Widget Function(T? data);

class ScreenConfig<T> {
  final AppScreen screen;
  final ScreenBuilder<T> builder;

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

  static var rootScreen = ScreenConfig(
    screen: AppScreen.RootScreen,
    builder: (data) => Rootscreen(),
  );

  static var homeScreen = ScreenConfig(
    screen: AppScreen.HomeScreen,
    builder: (data) => HomeScreen(),
  );

  static var historyScreen = ScreenConfig(
    screen: AppScreen.HistoryScreen,
    builder: (data) => HistoryScreen(onBackPress: data as Function),
  );

  static var profileScreen = ScreenConfig(
    screen: AppScreen.ProfileScreen,
    builder: (data) => ProfileScreen(onBackPress: data as Function),
  );

  static var preferenceScreen = ScreenConfig(
    screen: AppScreen.ProfileScreen,
    builder: (data) => PreferencesScreen(),
  );

  static var editProfileScreen = ScreenConfig(
    screen: AppScreen.EditProfileScreen,
    builder: (data) => EditProfileScreen(),
  );

  static var aiAssistantScreen = ScreenConfig(
    screen: AppScreen.AiAssistantScreen,
    builder: (data) => AiAssistantScreen(),
  );

  static var chatScreen = ScreenConfig(
    screen: AppScreen.ChatScreen,
    builder: (data) => ChatScreen(extraData: data as int?),
  );
}
