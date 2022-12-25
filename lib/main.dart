import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app/binding.dart';
import 'app/common/config_service.dart';
import 'app/di.dart';
import 'app/routes/app_pages.dart';
import 'generated/locales.g.dart';
import 'util/keyboard.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DI.init();
  runApp(
    GetMaterialApp(
      title: 'Application',
      debugShowCheckedModeBanner: false,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      initialBinding: AppBinding(),
      translationsKeys: AppTranslation.translations,
      theme: ConfigService.getThemeData(),
      locale: ConfigService.getLocale(),
      fallbackLocale: Locale('en', 'US'),
      builder: (context, child) => Scaffold(
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
