import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:luffy/generated/locales.g.dart';

import '../controllers/live_controller.dart';

class LiveView extends StatelessWidget {
  const LiveView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<LiveController>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('ChatView'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  controller.foo();
                },
                child: Text('weather')),
            SizedBox(height: 50),
            Text(LocaleKeys.buttons_login.tr),
            Text(LocaleKeys.buttons_sign_in.tr),
            Text(LocaleKeys.buttons_logout.tr),
            Text(LocaleKeys.buttons_sign_in_fb.tr),
            Text(LocaleKeys.buttons_sign_in_google.tr),
            Text(LocaleKeys.buttons_sign_in_apple.tr),
            SizedBox(height: 50),
            ElevatedButton(
                onPressed: () {
                  controller.updateLocale('en', 'US');
                },
                child: Text('英文')),
            SizedBox(height: 50),
            ElevatedButton(
                onPressed: () {
                  controller.updateLocale('zh', 'CN');
                },
                child: Text('中文')),
          ],
        ),
      ),
    );
  }
}
