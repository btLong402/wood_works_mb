import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:wood_works/core/gen/assets.gen.dart';

class TransService extends Translations {
  // static const locale = Locale('vi', 'VN');
  static const locale = Locale('en', 'US');
  static const fallbackLocale = Locale('vi', 'VN');

  static final langs = ['English', 'Vietnamese'];
  static final locales = [const Locale('en', 'US'), const Locale('vi', 'VN')];

  static Map<String, Map<String, String>> _translations = {};

  static Future<void> init() async {
    _translations = await _loadTranslations();
  }

  @override
  Map<String, Map<String, String>> get keys => _translations;

  static Future<Map<String, Map<String, String>>> _loadTranslations() async {
    final enJson = await rootBundle.loadString(Assets.languages.en);
    final viJson = await rootBundle.loadString(Assets.languages.vn);
    return {
      'en': Map<String, String>.from(json.decode(enJson)),
      'vi': Map<String, String>.from(json.decode(viJson)),
    };
  }
}
