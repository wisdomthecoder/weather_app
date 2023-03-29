import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:geolocator/geolocator.dart';
import '../models/weather_model.dart';

class WeatherApi {
  static const _baseUrl = 'https://api.weatherapi.com/v1';
  static const _apiKey = '8e419f5a7c5647bcb8e83741232903';

  static Future<WeatherModel> getWeather({required String city}) async {
    final url = '$_baseUrl/current.json?key=$_apiKey&q=$city';
    final response = await http.get(Uri.parse(url));
    final json = jsonDecode(response.body);
    return WeatherModel.fromJson(json);
  }

  static Future<WeatherModel> getLocationWeather() async {
    final position = await Geolocator.getCurrentPosition();
    final url =
        '$_baseUrl/current.json?key=$_apiKey&q=${position.latitude},${position.longitude}';
    final response = await http.get(Uri.parse(url));
    final json = jsonDecode(response.body);
    return WeatherModel.fromJson(json);
  }
}
