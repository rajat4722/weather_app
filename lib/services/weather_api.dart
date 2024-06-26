import 'dart:convert';
import 'package:http/http.dart' as http;

class WeatherApiService {
  String apiKey = 'ffa34f41a78bac5d4b59b1d3cb6a2717';

  WeatherApiService(this.apiKey);

  Future<Map<String, dynamic>?> fetchWeatherData(String cityName) async {
    final url =
        'https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apiKey&units=metric';

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        print('Failed to load weather data: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('Failed to connect to the server: $e');
      return null;
    }
  }
}
