import '../WeatherCard.dart';
import '../models/Weather.dart';
import 'package:flutter/material.dart';

class WeatherCardWrapper extends StatelessWidget {
  final Weather weather;
  final Size size;

  const WeatherCardWrapper({super.key, required this.weather, required this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        WeatherCard(
          weather.cityName,
          weather.temperature,
          weather.iconCode,
          weather.description,
          size,
          temperatureFontSize : 64,
          iconScale: 0.8,
        )
      ]),
    );
  }
}