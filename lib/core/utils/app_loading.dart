import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

/// A utility class for managing loading states and indicators throughout the app.
/// This class provides a wrapper around EasyLoading with predefined styles and configurations.
class AppLoading {
  AppLoading._();

  /// Initialize the loading configuration.
  /// Should be called once at app startup.
  static void init() {
    EasyLoading.instance
      ..displayDuration = const Duration(milliseconds: 2000)
      ..indicatorType = EasyLoadingIndicatorType.fadingCircle
      ..loadingStyle = EasyLoadingStyle.dark
      ..indicatorSize = 45.0
      ..radius = 10.0
      ..progressColor = Colors.white
      ..backgroundColor = Colors.black.withOpacity(0.8)
      ..indicatorColor = Colors.white
      ..textColor = Colors.white
      ..maskColor = Colors.black.withOpacity(0.5)
      ..userInteractions = false
      ..dismissOnTap = false;
  }

  /// Show a loading indicator with optional [status] message
  static void show({String? status}) {
    EasyLoading.show(status: status);
  }

  /// Hide the current loading indicator
  static void dismiss() {
    EasyLoading.dismiss();
  }

  /// Show a success message
  static void showSuccess(String message) {
    EasyLoading.showSuccess(message);
  }

  /// Show an error message
  static void showError(String message) {
    EasyLoading.showError(message);
  }

  /// Show an info message
  static void showInfo(String message) {
    EasyLoading.showInfo(message);
  }

  /// Show a warning message
  static void showToast(String message) {
    EasyLoading.showToast(message);
  }

  /// Returns true if loading is currently shown
  static bool get isLoading => EasyLoading.isShow;
}
