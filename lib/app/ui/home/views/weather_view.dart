import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../widget/image.dart';
import '../controllers/weather_controller.dart';

class WeatherView extends StatefulWidget {
  const WeatherView({Key? key}) : super(key: key);

  @override
  State<WeatherView> createState() => _WeatherViewState();
}

class _WeatherViewState extends State<WeatherView>
    with AutomaticKeepAliveClientMixin<WeatherView> {
  @override
  bool get wantKeepAlive => true;

  final ctrl = Get.find<WeatherController>();

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return GetBuilder<WeatherController>(builder: (controller) {
      return !controller.flag
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Scaffold(
              body: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.grey.shade300,
                      Colors.grey.shade600,
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      _cloudIcon(),
                      _temperature(),
                      _location(),
                      _date(),
                      _hourlyPrediction(),
                      _weeklyPrediction(),
                    ],
                  ),
                ),
              ),
            );
    });
  }

  // return Padding(padding: const EdgeInsets.all(28.0), child: Icon(Icons.sunny, size: 80));
  _cloudIcon() => Row(
        children: [
          SizedBox(width: 80),
          Center(
            child: cachedNetworkImage(
              ctrl.imageUrl40x40(ctrl.weather.real.weather.img),
              width: 120,
              height: 120,
            ),
          ),
          SizedBox(width: 50),
          DropdownButton(
            items: [
              DropdownMenuItem(
                value: 59758,
                child: Text('海口'),
              ),
              DropdownMenuItem(
                value: 59287,
                child: Text('广州'),
              ),
              DropdownMenuItem(
                value: 54511,
                child: Text('北京'),
              ),
            ],
            value: ctrl.city,
            onChanged: (value) {
              ctrl.setCity(value!);
              ctrl.getWeather();
            },
          ),
        ],
      );

  _temperature() => Text(
        '${ctrl.weather.real.weather.temperature}°',
        style: TextStyle(fontSize: 60, fontWeight: FontWeight.w100),
      );

  _location() => Row(
        children: [
          Icon(Icons.place),
          SizedBox(width: 10),
          Text(
              '${ctrl.weather.real.station.province} ${ctrl.weather.real.station.city}')
        ],
      );

  _date() => Row(
        children: [Text(ctrl.week()), SizedBox(width: 10), Text(ctrl.today())],
      );

  final times = ['1', '2', '3', '4', '5', '6', '7', '8', '9'];
  _hourlyPrediction() {
    return Container(
      height: 100,
      margin: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: Colors.white),
          bottom: BorderSide(color: Colors.white),
        ),
      ),
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: times.length,
          itemBuilder: (BuildContext context, int index) {
            return SizedBox(
              width: 50,
              child: Card(
                child: Center(
                  child: Text(times[index]),
                ),
              ),
            );
          }),
    );
  }

  _weeklyPrediction() => Expanded(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: ctrl.weather.predict.detail
            .map(
              (e) => Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: e.day.weather.info == '9999'
                    ? [
                        Text(e.date),
                        cachedNetworkImage(
                            ctrl.imageUrl40x40(e.night.weather.img)),
                        Text('${e.night.weather.temperature} °C'),
                        Text(e.night.weather.info),
                      ]
                    : [
                        Text(e.date),
                        cachedNetworkImage(
                            ctrl.imageUrl40x40(e.day.weather.img)),
                        Text('${e.day.weather.temperature} °C'),
                        Text(e.day.weather.info),
                      ],
              ),
            )
            .toList(),
      ));
}
