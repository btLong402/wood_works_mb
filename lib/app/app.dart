import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:wood_works/app/routes/app_pages.dart';
import 'package:wood_works/ui/theme/app_theme.dart';

// ignore: depend_on_referenced_packages
import 'package:flutter_localizations/flutter_localizations.dart';
import 'service/trans_service.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Wood Works',
      debugShowCheckedModeBanner: false,

      // Localization
      locale: TransService.locale,
      fallbackLocale: TransService.fallbackLocale,
      translations: TransService(),

      // Theme
      theme: AppTheme.lightTheme,
      themeMode: ThemeMode.system,

      // Localization
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', 'US'),
        Locale('vi', 'VN'),
      ],

      // Navigation
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      unknownRoute: AppPages.unknownRoute,
      defaultTransition: Transition.cupertino,

      builder: EasyLoading.init(),
    );
  }
}
