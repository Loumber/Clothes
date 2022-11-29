import 'dart:convert';

import '../models/Weather.dart';
import 'package:http/http.dart' as http;

class WeatherService {
  static String _apiKey = "a9efd417f5f75b95b5824095c87f23bc";

  static Future<Weather> fetchCurrentWeather({query, String lat = "", String lon =""}) async {
     var url =
         'http://api.openweathermap.org/data/2.5/weather?q=$query&lat=$lat&lon=$lon&appid=$_apiKey&units=metric&lang=ru';
    final response = await http.post(url);

    if (response.statusCode == 200) {
      return Weather.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load weather');
    }
  }

}