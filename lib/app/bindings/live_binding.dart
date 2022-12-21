import 'package:get/get.dart';

import '../modules/live/controllers/live_controller.dart';

class LiveBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LiveController>(
      () => LiveController(),
    );
  }
}
