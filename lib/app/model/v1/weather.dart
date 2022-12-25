import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'weather.g.dart';

@JsonSerializable(explicitToJson: true)
class WeatherResp {
  late WeatherRespReal real;
  late WeatherRespPredict predict;
  late WeatherRespAir air;

  WeatherResp();

  factory WeatherResp.fromJson(Map<String, dynamic> json) =>
      _$WeatherRespFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherRespToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable(explicitToJson: true)
class WeatherRespReal {
  late WeatherRespRealStation station;
  @JsonKey(name: "publish_time")
  late String publishTime;
  late WeatherRespRealWeather weather;
  late WeatherRespRealWind wind;
  late WeatherRespRealWarn warn;

  WeatherRespReal();

  factory WeatherRespReal.fromJson(Map<String, dynamic> json) =>
      _$WeatherRespRealFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherRespRealToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable(explicitToJson: true)
class WeatherRespRealStation {
  late String code;
  late String province;
  late String city;
  late String url;

  WeatherRespRealStation();

  factory WeatherRespRealStation.fromJson(Map<String, dynamic> json) =>
      _$WeatherRespRealStationFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherRespRealStationToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable(explicitToJson: true)
class WeatherRespRealWeather {
  late double temperature;
  late double temperatureDiff;
  late double airpressure;
  late double humidity;
  late double rain;
  late double rcomfort;
  late double icomfort;
  late String info;
  late String img;
  late double feelst;

  WeatherRespRealWeather();

  factory WeatherRespRealWeather.fromJson(Map<String, dynamic> json) =>
      _$WeatherRespRealWeatherFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherRespRealWeatherToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable(explicitToJson: true)
class WeatherRespRealWind {
  late String direct;
  late double degree;
  late String power;
  late double speed;

  WeatherRespRealWind();

  factory WeatherRespRealWind.fromJson(Map<String, dynamic> json) =>
      _$WeatherRespRealWindFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherRespRealWindToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable(explicitToJson: true)
class WeatherRespRealWarn {
  late String alert;
  late String pic;
  late String province;
  late String city;
  late String url;
  late String issuecontent;
  late String fmeans;
  late String signaltype;
  late String signallevel;
  late String pic2;

  WeatherRespRealWarn();

  factory WeatherRespRealWarn.fromJson(Map<String, dynamic> json) =>
      _$WeatherRespRealWarnFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherRespRealWarnToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable(explicitToJson: true)
class WeatherRespPredict {
  late WeatherRespPredictStation station;
  @JsonKey(name: "publish_time")
  late String publishTime;
  late List<WeatherRespPredictDetail> detail;

  WeatherRespPredict();

  factory WeatherRespPredict.fromJson(Map<String, dynamic> json) =>
      _$WeatherRespPredictFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherRespPredictToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable(explicitToJson: true)
class WeatherRespPredictStation {
  late String code;
  late String province;
  late String city;
  late String url;

  WeatherRespPredictStation();

  factory WeatherRespPredictStation.fromJson(Map<String, dynamic> json) =>
      _$WeatherRespPredictStationFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherRespPredictStationToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable(explicitToJson: true)
class WeatherRespPredictDetail {
  late String date;
  late String pt;
  late WeatherRespPredictDetailDay day;
  late WeatherRespPredictDetailNight night;

  WeatherRespPredictDetail();

  factory WeatherRespPredictDetail.fromJson(Map<String, dynamic> json) =>
      _$WeatherRespPredictDetailFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherRespPredictDetailToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable(explicitToJson: true)
class WeatherRespPredictDetailDay {
  late WeatherRespPredictDetailDayWeather weather;
  late WeatherRespPredictDetailDayWind wind;

  WeatherRespPredictDetailDay();

  factory WeatherRespPredictDetailDay.fromJson(Map<String, dynamic> json) =>
      _$WeatherRespPredictDetailDayFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherRespPredictDetailDayToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable(explicitToJson: true)
class WeatherRespPredictDetailDayWeather {
  late String info;
  late String img;
  late String temperature;

  WeatherRespPredictDetailDayWeather();

  factory WeatherRespPredictDetailDayWeather.fromJson(
          Map<String, dynamic> json) =>
      _$WeatherRespPredictDetailDayWeatherFromJson(json);

  Map<String, dynamic> toJson() =>
      _$WeatherRespPredictDetailDayWeatherToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable(explicitToJson: true)
class WeatherRespPredictDetailDayWind {
  late String direct;
  late String power;

  WeatherRespPredictDetailDayWind();

  factory WeatherRespPredictDetailDayWind.fromJson(Map<String, dynamic> json) =>
      _$WeatherRespPredictDetailDayWindFromJson(json);

  Map<String, dynamic> toJson() =>
      _$WeatherRespPredictDetailDayWindToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable(explicitToJson: true)
class WeatherRespPredictDetailNight {
  late WeatherRespPredictDetailNightWeather weather;
  late WeatherRespPredictDetailNightWind wind;

  WeatherRespPredictDetailNight();

  factory WeatherRespPredictDetailNight.fromJson(Map<String, dynamic> json) =>
      _$WeatherRespPredictDetailNightFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherRespPredictDetailNightToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable(explicitToJson: true)
class WeatherRespPredictDetailNightWeather {
  late String info;
  late String img;
  late String temperature;

  WeatherRespPredictDetailNightWeather();

  factory WeatherRespPredictDetailNightWeather.fromJson(
          Map<String, dynamic> json) =>
      _$WeatherRespPredictDetailNightWeatherFromJson(json);

  Map<String, dynamic> toJson() =>
      _$WeatherRespPredictDetailNightWeatherToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable(explicitToJson: true)
class WeatherRespPredictDetailNightWind {
  late String direct;
  late String power;

  WeatherRespPredictDetailNightWind();

  factory WeatherRespPredictDetailNightWind.fromJson(
          Map<String, dynamic> json) =>
      _$WeatherRespPredictDetailNightWindFromJson(json);

  Map<String, dynamic> toJson() =>
      _$WeatherRespPredictDetailNightWindToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable(explicitToJson: true)
class WeatherRespAir {
  late String forecasttime;
  late int aqi;
  late int aq;
  late String text;
  late String aqiCode;

  WeatherRespAir();

  factory WeatherRespAir.fromJson(Map<String, dynamic> json) =>
      _$WeatherRespAirFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherRespAirToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
