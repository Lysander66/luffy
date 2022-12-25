import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../cache/common.dart';
import '../model/global_config.dart';
import 'logger.dart';

class ConfigService {
  static GlobalConfig getGlobalConfig() {
    var value = CommonCache.getGlobalConfig();
    if (value != null) {
      vlog.d('read: $value');
      return value;
    }
    // initialize
    var defaultGlobalConfig = GlobalConfig(language: 'en_US');
    vlog.d('default: $defaultGlobalConfig');
    return defaultGlobalConfig;
  }

  static Locale? getLocale() {
    var language = getGlobalConfig().language;
    var list = language.split('_');
    if (list.length != 2) {
      vlog.e('unsupported $language');
      return Get.deviceLocale;
    }
    return Locale(list[0], list[1]);
  }

  static ThemeData getThemeData() {
    var isDarkMode = getGlobalConfig().isDarkMode;
    return isDarkMode ? ThemeData.dark() : ThemeData.light();
  }
}
