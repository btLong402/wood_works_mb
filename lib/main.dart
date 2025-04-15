import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';
import 'package:wood_works/app/app.dart';
import 'package:wood_works/app/service/trans_service.dart';
import 'package:wood_works/core/utils/app_loading.dart';

Future _binding() async {
  await GetStorage.init();
  await TransService.init();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Colors.transparent,
    ),
  );
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _binding();
  runApp(const App());
  AppLoading.init();
}
