import '../model/global_config.dart';
import 'define.dart';

class CommonCache {
  CommonCache._();
  static const globalConfigKey = 'globalConfig';

  static GlobalConfig? getGlobalConfig() {
    var value = box.read(globalConfigKey);
    return value == null ? value : GlobalConfig.fromJson(value);
  }

  static Future<void> setGlobalConfig(GlobalConfig value) async {
    await box.write(globalConfigKey, value);
  }
}
