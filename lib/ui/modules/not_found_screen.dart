import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wood_works/app/routes/app_pages.dart';
import 'package:wood_works/core/gen/app_keys.gen.dart';
import 'package:wood_works/ui/theme/app_typo.dart';

class NotFoundScreen extends StatelessWidget {
  const NotFoundScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.error_outline_rounded,
                  size: 100,
                  color: Theme.of(context).colorScheme.error,
                ),
                AppTypo.g20,
                const Text(
                  "404",
                  style: TextStyle(
                    fontSize: AppTypo.h1,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                AppTypo.g8,
                Text(
                  AppKeys.pageNotFound.tr,
                  style: const TextStyle(
                    fontSize: AppTypo.h3,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
                AppTypo.g16,
                Text(
                  AppKeys.pageNotFoundMessage.tr,
                  style: TextStyle(
                    fontSize: AppTypo.h5,
                    color: Theme.of(context)
                        .colorScheme
                        .onSurface
                        .withOpacity(0.7),
                  ),
                  textAlign: TextAlign.center,
                ),
                AppTypo.g32,
                ElevatedButton(
                  onPressed: () => Get.offAllNamed(Routes.splash),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 32, vertical: 16),
                  ),
                  child: Text(AppKeys.goHome.tr),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
