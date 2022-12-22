import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:luffy/util/logger/log.dart';

class Language {
  late String languageCode;
  late String countryCode;
}

class LiveController extends GetxController {
  void updateLocale(languageCode, countryCode) {
    var locale = Locale(languageCode, countryCode);
    Get.updateLocale(locale);
  }

  Future<void> foo() async {
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
