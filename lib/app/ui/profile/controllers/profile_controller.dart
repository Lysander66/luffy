import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../cache/common.dart';
import '../../../common/config_service.dart';
import '../../../common/logger.dart';
import '../../../dao/define.dart';
import '../../../model/global_config.dart';

class ProfileController extends GetxController {
  late String env;
  late GlobalConfig globalConfig;
  String host = 'ws://192.168.1.6:8080';

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
    Get.snackbar('Language', language, duration: Duration(seconds: 1));

    CommonCache.setGlobalConfig(globalConfig);
  }

  switchEnv(String env) async {
    if (this.env == env) {
      return;
    }
    this.env = env;
    update();
    Get.snackbar('Env', env, duration: Duration(seconds: 1));

    CommonCache.setEnvironment(env);
    initHttpClient();
  }

  updateHost(String host) {
    this.host = host;
    update(['input_host']);
  }
}
