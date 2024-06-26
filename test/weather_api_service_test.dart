import 'package:flutter_test/flutter_test.dart';
import 'package:weather_app/services/weather_api.dart';

void main() {
  group('WeatherApiService', () {
    late WeatherApiService weatherApi;

    setUp(() {
      weatherApi = WeatherApiService('your_api_key');
    });

    test('Fetch weather data for valid city', () async {
      final cityName = 'London';
      final weatherData = await weatherApi.fetchWeatherData(cityName);
      expect(weatherData, isNotNull);
      expect(weatherData!['name'], cityName);
      // Add more assertions based on API response structure
    });

    test('Handle network error', () async {
      // Simulate network error scenario
      final cityName = 'NonExistentCity';
      final weatherData = await weatherApi.fetchWeatherData(cityName);
      expect(weatherData, isNull);
      // Verify error handling behavior
    });

    // Add more tests as needed
  });
}
