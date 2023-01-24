import 'package:summer/summer.dart' as summer;

import '../common/constant/env.dart';
import '../model/v1/weather.dart';
import 'define.dart';

class WeatherDao {
  WeatherDao._();

  static late summer.Client client;

  static const _hostProd = 'http://www.nmc.cn';
  static const _hostDev = 'http://www.nmc.cn';
  static const _weather = '/rest/weather';

  static init(String env) {
    client = summer.Client(
      baseURL: env == Environment.prod ? _hostProd : _hostDev,
      afterResponse: onAfterResponse,
    );
  }

  static Future<WeatherResp> getWeather(int id) async {
    final response = await client
        .R()
        .setQueryParam('stationid', id.toString())
        .get(_weather);
    return WeatherResp.fromJson(response.data);
  }
}
