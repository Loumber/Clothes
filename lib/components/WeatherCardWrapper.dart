import '../WeatherCard.dart';
import '../models/Weather.dart';
import 'package:flutter/material.dart';

class WeatherCardWrapper extends StatelessWidget {
  final Weather weather;

  const WeatherCardWrapper({super.key, required this.weather});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        WeatherCard(
          weather.cityName,
          weather.temperature,
          weather.iconCode,
          temperatureFontSize : 64,
          iconScale: 0.6,
        )
      ]),
    );
  }
}