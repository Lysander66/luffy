import 'package:get/get.dart';

import 'modules/home/controllers/home_controller.dart';
import 'modules/live/controllers/live_controller.dart';
import 'modules/profile/controllers/profile_controller.dart';
import 'modules/splash/controllers/splash_controller.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashController>(() => SplashController());
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<LiveController>(() => LiveController());
    Get.lazyPut<ProfileController>(() => ProfileController());
  }
}
