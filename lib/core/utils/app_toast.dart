import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wood_works/core/gen/app_keys.gen.dart';

enum ToastType { success, error, warning, info }

class AppToast {
  AppToast._();

  static final AppToast instance = AppToast._();

  /// Dismisses any active toast before showing a new one
  static void _dismissActiveToast() {
    if (Get.isSnackbarOpen) {
      Get.closeCurrentSnackbar();
    }
  }

  /// Show a toast message with customizable options
  static void show({
    required String message,
    ToastType type = ToastType.info,
    Duration duration = const Duration(seconds: 2),
    SnackPosition position = SnackPosition.TOP,
    double? fontSize,
    EdgeInsets? margin,
    double? borderRadius,
    Widget? icon,
  }) {
    _dismissActiveToast();

    final config = _getToastConfig(type);

    Get.snackbar(
      config.title,
      message,
      backgroundColor: config.backgroundColor,
      colorText: config.textColor,
      duration: duration,
      margin: margin ?? const EdgeInsets.all(10),
      borderRadius: borderRadius ?? 8,
      snackPosition: position,
      isDismissible: true,
      dismissDirection: DismissDirection.horizontal,
      forwardAnimationCurve: Curves.easeOutCirc,
      reverseAnimationCurve: Curves.easeInCirc,
      icon: icon ??
          Icon(
            config.icon,
            color: config.textColor,
            size: 24,
          ),
      snackStyle: SnackStyle.FLOATING,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      shouldIconPulse: false,
    );
  }

  /// Show success toast
  static void success(String message,
      {Duration? duration, SnackPosition? position}) {
    show(
      message: message,
      type: ToastType.success,
      duration: duration ?? const Duration(seconds: 2),
      position: position ?? SnackPosition.TOP,
    );
  }

  /// Show error toast
  static void error(String message,
      {Duration? duration, SnackPosition? position}) {
    show(
      message: message,
      type: ToastType.error,
      duration: duration ?? const Duration(seconds: 3),
      position: position ?? SnackPosition.TOP,
    );
  }

  /// Show warning toast
  static void warning(String message,
      {Duration? duration, SnackPosition? position}) {
    show(
      message: message,
      type: ToastType.warning,
      duration: duration ?? const Duration(seconds: 2),
      position: position ?? SnackPosition.TOP,
    );
  }

  /// Show info toast
  static void info(String message,
      {Duration? duration, SnackPosition? position}) {
    show(
      message: message,
      type: ToastType.info,
      duration: duration ?? const Duration(seconds: 2),
      position: position ?? SnackPosition.TOP,
    );
  }

  /// Get configuration for toast type
  static _ToastConfig _getToastConfig(ToastType type) {
    switch (type) {
      case ToastType.success:
        return _ToastConfig(
          title: AppKeys.notifySuccess.tr,
          backgroundColor: const Color(0xFF4CAF50).withOpacity(0.9),
          textColor: Colors.white,
          icon: Icons.check_circle,
        );
      case ToastType.error:
        return _ToastConfig(
          title: AppKeys.notifyError.tr,
          backgroundColor: const Color(0xFFF44336).withOpacity(0.9),
          textColor: Colors.white,
          icon: Icons.error,
        );
      case ToastType.warning:
        return _ToastConfig(
          title: AppKeys.notifyWarning.tr,
          backgroundColor: const Color(0xFFFF9800).withOpacity(0.9),
          textColor: Colors.white,
          icon: Icons.warning,
        );
      case ToastType.info:
        return _ToastConfig(
          title: AppKeys.notifyInfo.tr,
          backgroundColor: const Color(0xFF2196F3).withOpacity(0.9),
          textColor: Colors.white,
          icon: Icons.info,
        );
    }
  }
}

class _ToastConfig {
  final String title;
  final Color backgroundColor;
  final Color textColor;
  final IconData icon;

  _ToastConfig({
    required this.title,
    required this.backgroundColor,
    required this.textColor,
    required this.icon,
  });
}
