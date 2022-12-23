import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'app/binding/binding.dart';
import 'app/common/config_service.dart';
import 'app/routes/app_pages.dart';
import 'generated/locales.g.dart';
import 'util/keyboard.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();

  runApp(
    GetMaterialApp(
      title: "Application",
      debugShowCheckedModeBanner: false,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      initialBinding: InitialBinding(),
      translationsKeys: AppTranslation.translations,
      theme: ConfigService.getThemeData(),
      locale: ConfigService.getLocale(),
      fallbackLocale: Locale('en', 'US'),
      builder: (context, child) => Scaffold(
        // Global GestureDetector that will dismiss the keyboard
        body: GestureDetector(
          onTap: () {
            KeyboardUtils.hideKeyboard(context);
          },
          child: child,
        ),
      ),
    ),
  );
}
