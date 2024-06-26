import 'package:flutter/material.dart';

class WeatherDetailCard extends StatelessWidget {
  final String temperature;
  final String humidity;
  final String windSpeed;
  final String visibility;
  final String pressure;
  final Color cardColor;

  const WeatherDetailCard({
    super.key,
    required this.temperature,
    required this.humidity,
    required this.windSpeed,
    required this.visibility,
    required this.pressure,
    required this.cardColor,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: cardColor,

      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
    
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: [
                Column(
                
                  children: [
                    const Text('Temperature',
                        style: TextStyle(fontSize: 12, color: Colors.white)),
                    Text(temperature,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        )),
                  ],
                ),
                const Spacer(),
                Column(
                  
                  children: [
                    const Text('Humidity',
                        style: TextStyle(fontSize: 12, color: Colors.white)),
                    Text(humidity, style: const TextStyle(fontSize: 16)),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Column(
                 
                  children: [
                    const Text('Wind Speed',
                        style: TextStyle(fontSize: 12, color: Colors.white)),
                    Text(windSpeed, style: const TextStyle(fontSize: 16)),
                  ],
                ),
                const Spacer(),
                Column(
                 
                  children: [
                    const Text('Visibility',
                        style: TextStyle(fontSize: 12, color: Colors.white)),
                    Text(visibility, style: const TextStyle(fontSize: 16)),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 10),
            Column(
             
              children: [
                const Text('Pressure',
                    style: TextStyle(fontSize: 12, color: Colors.white)),
                Text(pressure, style: const TextStyle(fontSize: 16)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
