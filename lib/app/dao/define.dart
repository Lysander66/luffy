import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:summer/summer.dart' as summer;

import '../cache/common.dart';
import '../common/constant/env.dart';
import '../common/logger.dart';
import 'config.dart';

final defaultClient = summer.Client();
late summer.Client pokemonClient;
late summer.Client weatherClient;

void initHttpClient() {
  final env = CommonCache.getEnvironment();

  // dev
  var pokemonHost = PokemonApi.hostDev;
  var weatherHost = WeatherApi.hostDev;

  // prod
  if (env != null && env == Environment.prod) {
    pokemonHost = PokemonApi.hostProd;
    weatherHost = WeatherApi.hostProd;
  }
  vlog.i('initHttpClient $env');

  pokemonClient = summer.Client(
    baseURL: pokemonHost,
  );

  weatherClient = summer.Client(
    baseURL: weatherHost,
    afterResponse: onAfterResponse,
  );
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
