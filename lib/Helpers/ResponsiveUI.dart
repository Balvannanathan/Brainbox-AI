import 'package:flutter/material.dart';

class ResponsiveUI {
  static late double _scaleWidth;
  static late double _scaleHeight;
  static late double _scaleText;

  /// Match with your Figma design
  static late double screenWidth;
  static late double screenHeight;

  ResponsiveUI(
    BuildContext context, {
    required double figmaWidth,
    required double figmaHeight,
  }) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;

    _scaleWidth = screenWidth / figmaWidth;
    _scaleHeight = screenHeight / figmaHeight;
    _scaleText = _scaleWidth < _scaleHeight ? _scaleWidth : _scaleHeight;
  }
}

extension ResponsiveUIExtensions on num {
  /// Width
  double get w => this * ResponsiveUI._scaleWidth;

  /// Height
  double get h => this * ResponsiveUI._scaleHeight;

  /// Font size
  double get sp => this * ResponsiveUI._scaleText;

  /// Border radius
  double get r => this * ResponsiveUI._scaleText;

  /// Line height (TextStyle.height)
  double lh(double fontSize) {
    final scaledFont = fontSize.sp;
    final scaledLine = sp;
    return scaledLine / scaledFont;
  }
}