import 'package:get/get.dart';
import 'package:wood_works/ui/modules/my_home.dart';
import 'package:wood_works/ui/modules/not_found_screen.dart';
import 'package:wood_works/ui/modules/splash_screen.dart';

class Routes {
  Routes._();

  static const splash = '/splash';
  static const notFound = '/not-found';
  static const myHome = '/my-home';
}

class AppPages {
  static const INITIAL = Routes.splash;

  static final routes = [
    GetPage(
      name: Routes.splash,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: Routes.myHome,
      page: () => const MyHome(),
    ),
  ];

  static final unknownRoute = GetPage(
    name: Routes.notFound,
    page: () => const NotFoundScreen(),
  );
}
