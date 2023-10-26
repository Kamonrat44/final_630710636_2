
class Weather {
  final String city;
  final String country;
  final String lastUpdated;
  final double tempC;
  final double tempF;
  final double feelsLikeC;
  final double feelsLikeF;
  final double windKph;
  final double windMph;
  final int humidity;
  final int uv;
  final Condition condition;

  Weather({
    required this.city,
    required this.country,
    required this.lastUpdated,
    required this.tempC,
    required this.tempF,
    required this.feelsLikeC,
    required this.feelsLikeF,
    required this.windKph,
    required this.windMph,
    required this.humidity,
    required this.uv,
    required this.condition,
  });
}

class Condition {
  final String text;
  final String icon;
  final double code;

  Condition({
    required this.text,
    required this.icon,
    required this.code,
  });
}

