import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:luffy/generated/locales.g.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ProfileController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Navigation Drawer'),
        backgroundColor: const Color(0xff764abc),
        centerTitle: true,
        actions: [
          GetBuilder<ProfileController>(
            init: controller,
            builder: (controller) {
              return IconButton(
                onPressed: () => controller
                    .toggleDarkMode(!controller.globalConfig.isDarkMode),
                icon: Icon(
                  controller.globalConfig.isDarkMode
                      ? Icons.dark_mode
                      : Icons.light_mode,
                ),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                controller.foo();
              },
              child: Text('weather'),
            ),
            SizedBox(height: 50),
            Text(LocaleKeys.buttons_login.tr),
            Text(LocaleKeys.buttons_sign_in.tr),
            Text(LocaleKeys.buttons_logout.tr),
            Text(LocaleKeys.buttons_sign_in_fb.tr),
            Text(LocaleKeys.buttons_sign_in_google.tr),
            Text(LocaleKeys.buttons_sign_in_apple.tr),
            SizedBox(height: 50),
            GetBuilder<ProfileController>(
              builder: (controller) {
                return DropdownButton(
                  items: [
                    DropdownMenuItem(
                      value: 'en_US',
                      child: Text(LocaleKeys.language_english.tr),
                    ),
                    DropdownMenuItem(
                      value: 'zh_CN',
                      child: Text(LocaleKeys.language_chinese.tr),
                    ),
                  ],
                  value: controller.globalConfig.language,
                  onChanged: (value) {
                    controller.updateLocale(value ?? '');
                  },
                );
              },
            ),
          ],
        ),
      ),
      drawer: Container(
        width: MediaQuery.of(context).size.width * 0.7,
        child: Drawer(
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: [
              const UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: Color(0xff764abc)),
                accountName: Text(
                  "Pinkesh Darji",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                accountEmail: Text(
                  "pinkesh.earth@gmail.com",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                currentAccountPicture: FlutterLogo(),
              ),
              ListTile(
                leading: Icon(
                  Icons.home,
                ),
                title: const Text('Page 1'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.train,
                ),
                title: const Text('Page 2'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              AboutListTile(
                icon: Icon(
                  Icons.info,
                ),
                applicationIcon: Icon(
                  Icons.local_play,
                ),
                applicationName: 'My Cool App',
                applicationVersion: '1.0.25',
                applicationLegalese: '© 2019 Company',
                aboutBoxChildren: [
                  ///Content goes here...
                ],
                child: Text('About app'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
