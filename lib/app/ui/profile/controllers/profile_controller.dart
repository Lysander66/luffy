import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../cache/common.dart';
import '../../../common/config_service.dart';
import '../../../common/logger.dart';
import '../../../dao/define.dart';
import '../../../model/global_config.dart';
import '../../../model/v1/weather.dart';

class ProfileController extends GetxController {
  late String env;
  late GlobalConfig globalConfig;

  @override
  void onInit() {
    super.onInit();
    env = CommonCache.getEnvironment() ?? '';
    globalConfig = ConfigService.getGlobalConfig();
  }

  toggleDarkMode(bool isDarkMode) {
    Get.changeTheme(isDarkMode ? ThemeData.dark() : ThemeData.light());

    globalConfig.isDarkMode = isDarkMode;
    update();
    CommonCache.setGlobalConfig(globalConfig);
  }

  updateLocale(String language) {
    if (globalConfig.language == language) {
      return;
    }
    var list = language.split('_');
    if (list.length != 2) {
      vlog.e('unsupported $language');
      return;
    }
    Get.updateLocale(Locale(list[0], list[1]));

    globalConfig.language = language;
    update();
    Get.snackbar("Language", language, duration: Duration(seconds: 1));

    CommonCache.setGlobalConfig(globalConfig);
  }

  switchEnv(String env) async {
    if (this.env == env) {
      return;
    }
    this.env = env;
    update();
    Get.snackbar("Env", env, duration: Duration(seconds: 1));

    CommonCache.setEnvironment(env);
    initHttpClient();
  }

  weather() async {
    var resp = await nmcClient
        .R()
        .setQueryParam('stationid', '59758')
        .get(ApiConfig.weather);

    var w = WeatherResp.fromJson(resp.data);
    vlog.i(w.real.weather);
    vlog.i(w.predict.detail.length);
    Get.defaultDialog(
        title: 'weather', content: Text(w.real.weather.toString()));

    // await Future.delayed(Duration(seconds: 1));
    // var resp2 = await defaultClient
    //     .R()
    //     .get('http://www.nmc.cn/rest/weather?stationid=59758');
    // var w2 = WeatherResp.fromJson(jsonDecode(resp2.body)['data']);
    // vlog.i(w2.air);
  }
}
