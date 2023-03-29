class WeatherModel {
  final int temperature;
  final String condition;
  final String cityName;

  WeatherModel(
      {required this.temperature,
      required this.condition,
      required this.cityName});

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      temperature: json['current']['temp_c'].toInt(),
      condition: json['current']['condition']['text'],
      cityName: json['location']['name'],
    );
  }
}
