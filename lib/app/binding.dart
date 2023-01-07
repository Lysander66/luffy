import 'package:get/get.dart';

import 'ui/home/controllers/home_controller.dart';
import 'ui/home/controllers/weather_controller.dart';
import 'ui/live/controllers/live_controller.dart';
import 'ui/pokemon/controllers/pokemon_controller.dart';
import 'ui/profile/controllers/profile_controller.dart';
import 'ui/splash/controllers/splash_controller.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashController>(() => SplashController());
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<LiveController>(() => LiveController());
    Get.lazyPut<WeatherController>(() => WeatherController());
    Get.lazyPut<PokemonController>(() => PokemonController());
    Get.lazyPut<ProfileController>(() => ProfileController());
  }
}
