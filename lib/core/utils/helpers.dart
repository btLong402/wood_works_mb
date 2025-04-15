import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

/// A collection of utility helper functions used throughout the application.
class Helpers {
  Helpers._();

  // String Helpers

  /// Capitalizes the first letter of a string
  static String capitalizeFirst(String text) {
    if (text.isEmpty) return '';
    return text[0].toUpperCase() + text.substring(1);
  }

  /// Truncates a string if it exceeds the maximum length
  static String truncate(String text, int maxLength, {String suffix = '...'}) {
    if (text.length <= maxLength) return text;
    return '${text.substring(0, maxLength)}$suffix';
  }

  /// Removes all HTML tags from a string
  static String stripHtml(String htmlString) {
    return htmlString.replaceAll(RegExp(r'<[^>]*>'), '');
  }

  // Validation Helpers

  /// Validates if the string is a valid email address
  static bool isValidEmail(String email) {
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
  }

  /// Validates if the string is a valid phone number
  static bool isValidPhone(String phone) {
    return RegExp(r'^\+?[0-9]{10,15}$').hasMatch(phone);
  }

  /// Validates if the string contains only letters
  static bool isAlphabetOnly(String text) {
    return RegExp(r'^[a-zA-Z]+$').hasMatch(text);
  }

  // Date Helpers

  /// Formats a DateTime object into a string with the specified format
  static String formatDate(DateTime date, {String format = 'dd/MM/yyyy'}) {
    return DateFormat(format).format(date);
  }

  /// Returns a relative time string (e.g., "2 hours ago")
  static String getRelativeTime(DateTime dateTime) {
    final now = DateTime.now();
    final difference = now.difference(dateTime);

    if (difference.inDays > 365) {
      return '${(difference.inDays / 365).floor()} year(s) ago';
    } else if (difference.inDays > 30) {
      return '${(difference.inDays / 30).floor()} month(s) ago';
    } else if (difference.inDays > 0) {
      return '${difference.inDays} day(s) ago';
    } else if (difference.inHours > 0) {
      return '${difference.inHours} hour(s) ago';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes} minute(s) ago';
    } else {
      return 'Just now';
    }
  }

  // Currency and Number Helpers

  /// Formats a number as currency
  static String formatCurrency(num amount,
      {String symbol = '\$', int decimalPlaces = 2}) {
    final formatter = NumberFormat.currency(
      symbol: symbol,
      decimalDigits: decimalPlaces,
    );
    return formatter.format(amount);
  }

  /// Formats a number with thousand separators
  static String formatNumber(num number) {
    return NumberFormat('#,###').format(number);
  }

  // UI Helpers

  /// Returns the screen width
  static double screenWidth() {
    return Get.width;
  }

  /// Returns the screen height
  static double screenHeight() {
    return Get.height;
  }

  /// Returns true if the device is in landscape orientation
  static bool isLandscape(BuildContext context) {
    return MediaQuery.of(context).orientation == Orientation.landscape;
  }

  // Device Helpers

  /// Returns true if the device is iOS
  static bool isIOS() {
    return Platform.isIOS;
  }

  /// Returns true if the device is Android
  static bool isAndroid() {
    return Platform.isAndroid;
  }

  // Misc Helpers

  /// Creates a debounced function that delays invoking the provided function
  static Function debounce(Function func,
      {Duration delay = const Duration(milliseconds: 300)}) {
    Timer? timer;
    return () {
      if (timer != null) {
        timer!.cancel();
      }
      timer = Timer(delay, () => func());
    };
  }

  /// Generates a random string of the specified length
  static String randomString(int length) {
    const chars = 'abcdefghijklmnopqrstuvwxyz0123456789';
    final random = StringBuffer();
    for (var i = 0; i < length; i++) {
      random.write(chars[DateTime.now().microsecondsSinceEpoch % chars.length]);
    }
    return random.toString();
  }
}
