import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_storage/get_storage.dart';

import 'cache/common.dart';
import 'common/constant/env.dart';
import 'common/logger.dart';
import 'dao/define.dart';

class DI {
  static Future<void> init() async {
    const env = String.fromEnvironment('AppEnvironment');

    await GetStorage.init();
    await CommonCache.setEnvironment(env.isNotEmpty ? env : Environment.dev);
    initHttpClient(env.isNotEmpty ? env : Environment.dev);

    final fileName = envFileName(env);
    if (fileName.isNotEmpty) {
      await dotenv.load(fileName: fileName);
      vlog.i('load $fileName');
      vlog.d(dotenv.env['FOOBAR']);
    }
  }

  static String envFileName(String env) {
    switch (env) {
      case Environment.dev:
        return '.env.development';
      case Environment.prod:
        return '.env.production';
      default:
    }
    return '';
  }
}
