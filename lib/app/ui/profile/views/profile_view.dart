import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:luffy/app/common/constant/env.dart';
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
            GetBuilder<ProfileController>(
              builder: (controller) {
                return DropdownButton(
                  items: [
                    DropdownMenuItem(
                      value: Environment.dev,
                      child: Text(LocaleKeys.environment_development.tr),
                    ),
                    DropdownMenuItem(
                      value: Environment.prod,
                      child: Text(LocaleKeys.environment_production.tr),
                    ),
                  ],
                  value: controller.env,
                  onChanged: (value) {
                    controller.switchEnv(value!);
                    // controller.updateLocale(value ?? '');
                  },
                );
              },
            ),
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
            SizedBox(height: 50),
            SizedBox(
              width: 200,
              child: GetBuilder<ProfileController>(
                id: 'input_host',
                builder: (controller) {
                  return TextFormField(
                    initialValue: controller.host,
                    decoration: InputDecoration(
                      labelText: 'host',
                      labelStyle: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    onChanged: (value) {
                      controller.updateHost(value);
                    },
                  );
                },
              ),
            ),
            SizedBox(height: 50),
            ElevatedButton(
              onPressed: () {
                controller.weather();
              },
              child: Text('weather'),
            ),
            SizedBox(height: 50),
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
                  'Pinkesh Darji',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                accountEmail: Text(
                  'pinkesh.earth@gmail.com',
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
