import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../common/logger.dart';
import '../../../dao/config.dart';
import '../../../dao/define.dart';
import '../../../model/v1/weather.dart';

class WeatherController extends GetxController {
  int city = 59758;
  WeatherResp weather = WeatherResp();

  @override
  void onInit() {
    super.onInit();
    getWeather();
  }

  setCity(int city) {
    this.city = city;
    update();
  }

  getWeather() async {
    var response = await weatherClient
        .R()
        .setQueryParam('stationid', city.toString())
        .get(WeatherApi.weather);

    weather = WeatherResp.fromJson(response.data);
    weather.code = city;
    update();
    vlog.i(weather.real.weather);

    // await Future.delayed(Duration(seconds: 1));
    // var resp = await defaultClient.R().get('http://www.nmc.cn/rest/weather?stationid=59758');
    // var w = WeatherResp.fromJson(jsonDecode(resp.body)['data']);
    // vlog.i(w.air);
    // Get.defaultDialog(title: 'weather', content: Text(w.real.weather.toString()));
  }

  String imageUrl40x40(String id) {
    return 'http://image.nmc.cn/assets/img/w/40x40/4/${id}.png';
  }

  String week() {
    return DateFormat.EEEE().format(DateTime.now());
  }

  String today() {
    return DateFormat('yyyy-MM-dd').format(DateTime.now());
  }
}