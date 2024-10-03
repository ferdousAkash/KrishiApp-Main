// ignore_for_file: file_names

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'weather_module.dart';

class WeatherData {
  Future<weather> getData(var latitude, var longitude) async {
    var uriCall = Uri.parse(
        'http://api.weatherapi.com/v1/current.json?key=67c2f49e1ed944ad8de154534230610&q=$longitude,$latitude&aqi=no');
    var response = await http.get(uriCall);
    var body = jsonDecode(response.body);
    return weather.fromJson(body);
  }
}
