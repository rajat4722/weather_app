import 'dart:convert';
import 'package:http/http.dart' as http;

class WeatherApiService {
  final String apiKey;

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
        // Handle specific HTTP status codes
        if (response.statusCode == 401) {
          throw Exception('Unauthorized - API key is invalid');
        } else {
          throw Exception('Failed to load weather data');
        }
      }
    } catch (e) {
      print('Failed to connect to the server: $e');
      throw Exception('Failed to connect to the server');
    }
  }
}
