// http://www.daydev.com/developer/s6-programming-language/api-openweather.html

class Weather {
  final double lat;
  final double lon;
  final double temp;
  final double feelsLike;
  final double low;
  final double high;
  final String description;
  final Uri icon;

  Weather(
      { required this.lat,
        required this.lon,
        required this.temp,
        required this.feelsLike,
        required this.low,
        required this.high,
        required this.description,
        required this.icon
      });

  @override
  String toString() {
    return 'Weather{temp: $temp, feelsLike: $feelsLike, low: $low, high: $high, description: $description, icon: $icon}';
  }
  factory Weather.fromJson(json, desc) {

    return Weather(
      lat: json['lat'],
      lon: json['lon'],
      temp: json['current']['temp'].toDouble()-273.15,
      feelsLike: json['current']['feels_like'].toDouble()-273.15,
      low: json['daily'][0]['temp']['min'].toDouble()-273.15,
      high: json['daily'][0]['temp']['max'].toDouble()-273.15,
      description: desc,
      icon: Uri.parse('http://openweathermap.org/img/wn/${json['current']['weather'][0]['icon']}@2x.png')
    );
  }
}