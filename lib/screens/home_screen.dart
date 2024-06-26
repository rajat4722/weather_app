import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/widgets/weather_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Map<String, dynamic>? _weatherData;
  String _cityName = '';
  final TextEditingController _cityController = TextEditingController();
  final String apiKey =
      'YOUR_API_KEY'; // Replace with your OpenWeatherMap API key

  @override
  void initState() {
    super.initState();
    // Set the app to fullscreen mode
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
  }

  @override
  void dispose() {
    _cityController.dispose();
    super.dispose();
  }

  Future<void> _fetchWeatherData() async {
    if (_cityName.isEmpty) return;

    final url =
        'https://api.openweathermap.org/data/2.5/weather?q=$_cityName&appid=$apiKey&units=metric';

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        setState(() {
          _weatherData = jsonDecode(response.body);
        });
      } else {
        _showErrorDialog('Error', 'Failed to load weather data');
      }
    } catch (e) {
      _showErrorDialog('Error', 'Failed to connect to the server');
    }
  }

  void _showErrorDialog(String title, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  String _getBackgroundImage(String weatherCondition) {
    switch (weatherCondition) {
      case 'Clear':
        return 'assets/images/clear.jpg';
      case 'Clouds':
        return 'assets/images/cloudy.jpg';
      case 'Rain':
        return 'assets/images/rain.jpg';
      case 'Snow':
        return 'assets/images/snow.jpg';
      case 'Thunderstorm':
        return 'assets/images/storm.jpg';
      default:
        return 'assets/images/default.jpg';
    }
  }

  String _getWeatherIcon(String weatherCondition) {
    switch (weatherCondition) {
      case 'Clear':
        return 'assets/png/sun.png';
      case 'Clouds':
        return 'assets/png/cloudy.png';
      case 'Rain':
        return 'assets/png/rainy.png';
      case 'Snow':
        return 'assets/png/snow.png';
      case 'Thunderstorm':
        return 'assets/png/thunder.png';
      default:
        return 'assets/png/default.png';
    }
  }

  Color _getCardColor(String weatherCondition) {
    switch (weatherCondition) {
      case 'Clear':
        return Colors.yellow.shade200.withOpacity(0.3);
      case 'Clouds':
        return Colors.grey.shade500.withOpacity(0.5);
      case 'Rain':
        return Colors.blueGrey.shade300.withOpacity(0.5);
      case 'Snow':
        return Colors.lightBlue.shade100.withOpacity(0.5);
      case 'Thunderstorm':
        return Colors.deepPurple.shade300.withOpacity(0.5);
      default:
        return Colors.green.shade200.withOpacity(0.3);
    }
  }

  @override
  Widget build(BuildContext context) {
    String weatherCondition =
        _weatherData != null ? _weatherData!['weather'][0]['main'] : 'default';
    String backgroundImage = _getBackgroundImage(weatherCondition);
    String weatherIcon = _getWeatherIcon(weatherCondition);
    Color cardColor = _getCardColor(weatherCondition);

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(backgroundImage),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (_weatherData != null)
                Image.asset(weatherIcon, width: 100, height: 100),
              const SizedBox(height: 100),
              TextField(
                controller: _cityController,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                
                  hintText: 'Enter city name',
                  hintStyle: const TextStyle(color: Colors.white),
                  filled: true,
                  fillColor: cardColor,
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.search, color: Colors.blue),
                    onPressed: () {
                      setState(() {
                        _cityName = _cityController.text;
                        _fetchWeatherData();
                      });
                    },
                  ),
                  border: UnderlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                onSubmitted: (value) {
                  setState(() {
                    _cityName = value;
                    _fetchWeatherData();
                  });
                },
              ),
              const SizedBox(height: 20),
              _weatherData == null
                  ? const Text('No data')
                  : WeatherDetailCard(
                      temperature: '${_weatherData!['main']['temp']}°C',
                      humidity: '${_weatherData!['main']['humidity']}%',
                      windSpeed: '${_weatherData!['wind']['speed']} m/s',
                      visibility: '${_weatherData!['visibility']} m',
                      pressure: '${_weatherData!['main']['pressure']} hPa',
                      cardColor: cardColor,
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
