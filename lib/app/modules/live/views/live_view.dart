import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
                child: Text('点击')),
            SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}
