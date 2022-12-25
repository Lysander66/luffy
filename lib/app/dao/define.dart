import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:summer/summer.dart' as summer;

import '../cache/common.dart';
import '../common/constant/env.dart';
import '../common/logger.dart';

late summer.Client defaultClient;
late summer.Client nmcClient;

void initHttpClient() {
  final env = CommonCache.getEnvironment();

  // dev
  var nmcHost = 'http://www.nmc.cn';

  // prod
  if (env != null && env == Environment.prod) {
    nmcHost = 'http://www.nmc.cn';
  }
  vlog.i('initHttpClient $env');

  defaultClient = summer.Client();
  nmcClient = summer.Client(
    baseURL: nmcHost,
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

abstract class ApiConfig {
  static const weather = '/rest/weather';
}
