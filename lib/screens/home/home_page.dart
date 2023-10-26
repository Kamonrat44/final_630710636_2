import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../models/weather.dart';

class MyWeatherApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Weather? _weather;
  String _selectedCity = 'Bangkok'; // เมืองที่ถูกเลือกเริ่มต้น

  final List<String> cities = [
    'Bangkok',
    'New York',
    'London',
    'Paris',
    'Nakhon Pathom'
  ];

  void _showWeather(String city) async {
    final apiKey = 'WeatherAPI'; // แทนด้วยคีย์ API ของคุณ
    final apiUrl = 'https://api.weatherapi.com/v1/current.json?key=$apiKey&q=$city';

    try {
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final weatherData = data['current'];

        // ดึงข้อมูลสภาพอากาศจาก JSON response
        final weather = Weather(
          city: city,
          country: weatherData['country'],
          lastUpdated: weatherData['last_updated'],
          tempC: weatherData['temp_c'],
          tempF: weatherData['temp_f'],
          feelsLikeC: weatherData['feelslike_c'],
          feelsLikeF: weatherData['feelslike_f'],
          windKph: weatherData['wind_kph'],
          windMph: weatherData['wind_mph'],
          humidity: weatherData['humidity'],
          uv: weatherData['uv'],
          condition: Condition(
            text: weatherData['condition']['text'],
            icon: weatherData['condition']['icon'],
            code: weatherData['condition']['code'],
          ),
        );

        setState(() {
          _weather = weather;
        });
      } else {
        throw Exception('Failed to load weather data');
      }
    } catch (e) {
      print('Error: $e');
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather App'),
        actions: <Widget>[
          PopupMenuButton(
            onSelected: (String city) {
              setState(() {
                _selectedCity = city;
              });
            },
            itemBuilder: (BuildContext context) {
              return cities.map((String city) {
                return PopupMenuItem<String>(
                  value: city,
                  child: Text(city),
                );
              }).toList();
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'City: $_selectedCity',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                _showWeather(_selectedCity);
              },
              child: Text('Get Weather'),
            ),
            SizedBox(height: 16),
            _weather != null
                ? Column(
              children: [
                Text('Last Updated: ${_weather!.lastUpdated}'),
                Text(
                    'Temperature: ${_weather!.tempC}°C (${_weather!.tempF}°F)'),
                Text('Feels Like: ${_weather!.feelsLikeC}°C (${_weather!
                    .feelsLikeF}°F)'),
                Text('Wind: ${_weather!.windKph} km/h (${_weather!
                    .windMph} mph)'),
                Text('Humidity: ${_weather!.humidity}%'),
                Text('UV Index: ${_weather!.uv}'),
                Text('Condition: ${_weather!.condition.text}'),
                Image.network(_weather!.condition.icon),
              ],
            )

          ],
        ),
      ),
    );
  }
}