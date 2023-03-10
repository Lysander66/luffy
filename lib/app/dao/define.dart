import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:summer/summer.dart' as summer;

import '../common/logger.dart';
import 'music_dao.dart';
import 'pokemon_dao.dart';
import 'weather_dao.dart';

final defaultClient = summer.Client();

void initHttpClient(String env) {
  WeatherDao.init(env);
  PokemonDao.init(env);
  MusicDao.init(env);

  vlog.i('initHttpClient $env');
}

Map<String, dynamic> onAfterResponse(http.Response response) {
  // 4xx  5xx
  if (response.statusCode >= HttpStatus.badRequest) {
    vlog.e('${response.statusCode} ${response.request?.url}');
    vlog.e(response.statusCode);
    // throw HttpException('${response.statusCode}');
    return {};
  }

  var resp = jsonDecode(response.body);
  if (resp['code'] != 0) {
    vlog.e('${resp['msg']} ${response.request?.url}');
    return {};
  }
  return resp['data'];
}
