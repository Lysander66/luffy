import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:luffy/util/logger/log.dart';

import '../../../cache/common.dart';
import '../../../common/config_service.dart';
import '../../../model/global_config.dart';

class ProfileController extends GetxController {
  late GlobalConfig globalConfig;

  @override
  void onInit() {
    super.onInit();
    globalConfig = ConfigService.getGlobalConfig();
  }

  toggleDarkMode(bool isDarkMode) {
    Get.changeTheme(isDarkMode ? ThemeData.dark() : ThemeData.light());

    globalConfig.isDarkMode = isDarkMode;
    update();
    CommonCache.setGlobalConfig(globalConfig);
  }

  updateLocale(String language) {
    var list = language.split("_");
    if (list.length != 2) {
      Log.e('unsupported $language');
      return;
    }
    Get.updateLocale(Locale(list[0], list[1]));

    globalConfig.language = language;
    update();
    CommonCache.setGlobalConfig(globalConfig);
  }

  foo() async {
    // http://www.nmc.cn/rest/weather?stationid=59758
    var url = Uri.http('www.nmc.cn', '/rest/weather', {'stationid': '59758'});
    var response = await http.get(url);
    if (response.statusCode == 200) {
      Log.i(response.body);
    } else {
      Log.e(response.statusCode);
    }
  }
}
