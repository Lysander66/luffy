import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:luffy/util/logger/log.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ProfileController>();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Navigation Drawer'),
        backgroundColor: const Color(0xff764abc),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  controller.foo();
                },
                child: Text('点击')),
            SizedBox(
              height: 50,
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
                decoration: BoxDecoration(color: const Color(0xff764abc)),
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
                child: Text('About app'),
                applicationIcon: Icon(
                  Icons.local_play,
                ),
                applicationName: 'My Cool App',
                applicationVersion: '1.0.25',
                applicationLegalese: '© 2019 Company',
                aboutBoxChildren: [
                  ///Content goes here...
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
